//
//  CoreDataWordRepository.swift
//  sightwords
//
//  Created by Angelo Marano on 11/1/15.
//  Copyright © 2015 Angelo Marano. All rights reserved.
//


import CoreData

class CoreDataWordRepository: NSObject, WordRepository {

    private var managedObjectContext: NSManagedObjectContext?

    override init() {
        super.init()
        setUpCoreData()
    }

    func GetWord() -> Word {
        let fetch = NSFetchRequest(entityName: "Word")
        do {
            var fetched = try managedObjectContext?.executeFetchRequest(fetch) as! [Word]
            return fetched[0]
        } catch {
            fatalError()
        }
    }

    func GetWord(id: String) -> Word {
        let fetch = NSFetchRequest(entityName: "Word")
        do {
            var fetched = try managedObjectContext?.executeFetchRequest(fetch) as! [Word]
            return fetched[0]
        } catch {
            fatalError()
        }
    }

    func GetWords(count: Int) -> [Word] {
        let fetch = NSFetchRequest(entityName: "Word")
        do {
            var fetched = try managedObjectContext?.executeFetchRequest(fetch) as! [Word]
            return fetched
        } catch {
            fatalError()
        }
    }

    func UpdateWord(word: Word) -> Bool {
        return true
    }

    func AddWord(word: Word) -> Bool {
        let attachedWord = NSEntityDescription.insertNewObjectForEntityForName("Word", inManagedObjectContext: managedObjectContext!) as! Word
        attachedWord.text = word.text
        attachedWord.id = word.id
        attachedWord.attempts = word.attempts
    }

    private func setUpCoreData() {
        guard let modelURL = NSBundle.mainBundle().URLForResource("SightWordsModel", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }

        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        self.managedObjectContext!.persistentStoreCoordinator = psc
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
            let docURL = urls[urls.endIndex - 1]

            let storeURL = docURL.URLByAppendingPathComponent("DataModel.sqlite")
            do {
                try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
    }
}
