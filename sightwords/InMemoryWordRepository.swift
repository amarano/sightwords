//
//  InMemoryWordRepository.swift
//  sightwords
//
//  Created by Angelo Marano on 10/30/15.
//  Copyright © 2015 Angelo Marano. All rights reserved.
//

import Foundation

class InMemoryWordRepository: WordRepository {
    var words = [Word(id: "1", word: "dog", attempts: []),
                 Word(id: "2", word: "cat", attempts: []),
                 Word(id: "3", word: "go", attempts: []),
                 Word(id: "4", word: "ball", attempts: [])]

    func GetWord(id: String) -> Word {
        return words.filter {
            $0.id == id
        }[0]
    }

    func GetWords(count: Int) -> [Word] {
        return words;
    }

    func UpdateWord(word: Word) -> Bool {
        return true;
    }

    func GetWord() -> Word {
        let randomIndex = arc4random_uniform(UInt32(words.count))
        let word = words[Int(randomIndex)]
        return word
    }

    func AddWord(word : Word) -> Bool {
        return true
    }
}
