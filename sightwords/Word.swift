//
//  Word.swift
//  sightwords
//
//  Created by Angelo Marano on 10/29/15.
//  Copyright © 2015 Angelo Marano. All rights reserved.
//

import UIKit

class Word: NSObject {

    var id: String
    var text: String
    var attempts: [Attempt]

    init(id: String, word: String, attempts: [Attempt]) {
        self.id = id
        self.text = word
        self.attempts = attempts
    }

}
