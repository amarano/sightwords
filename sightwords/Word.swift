//
//  Word.swift
//  sightwords
//
//  Created by Angelo Marano on 10/29/15.
//  Copyright © 2015 Angelo Marano. All rights reserved.
//

import UIKit
import CoreData

class Word: CoreData.NSManagedObject {

    @NSManaged var id: String
    @NSManaged var text: String
    @NSManaged var attempts: [Attempt]

    convenience init(id: String, word: String, attempts: [Attempt]) {

        self.init()

        self.id = id
        self.text = word
        self.attempts = attempts
    }

}
