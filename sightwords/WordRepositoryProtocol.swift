//
//  WordRepositoryProtocol.swift
//  sightwords
//
//  Created by Angelo Marano on 10/30/15.
//  Copyright © 2015 Angelo Marano. All rights reserved.
//

import Foundation


protocol WordRepository {

    func GetWords(count: Int) -> [Word]

    func GetWord(id: String) -> Word

    func GetWord() -> Word

    func UpdateWord(word: Word) -> Bool

}