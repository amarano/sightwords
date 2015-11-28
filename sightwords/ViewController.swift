//
//  ViewController.swift
//  sightwords
//
//  Created by Angelo Marano on 10/29/15.
//  Copyright © 2015 Angelo Marano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WordViewDelegate {

    var repository: WordRepository?
    var word: Word?
    var wordView: WordViewClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = CoreDataWordRepository()
        word = repository!.GetWord()
        wordView = WordViewClass(frame: self.view.frame, word: self.word!, delegate: self)
        addWordView()
    }

    func reportAttempt(attempt: Attempt) {
        self.word!.attempts.append(attempt)
        if (attempt.successful) {

        }
        updateWordView()
    }

    func addWordView() {
        view.addSubview(wordView!)
    }

    func updateWordView() {
        wordView?.word = repository!.GetWord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

