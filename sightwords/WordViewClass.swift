//
//  WordViewClass.swift
//  sightwords
//
//  Created by Angelo Marano on 10/29/15.
//  Copyright © 2015 Angelo Marano. All rights reserved.
//

import UIKit

class WordViewClass: UIView {
    var word: Word {
        didSet {
            self.label.text = word.text
        }
    }
    var delegate: WordViewDelegate;
    lazy var label = UILabel(frame: CGRectMake(50, 50, 100, 100))

    init(frame: CGRect, word: Word, delegate: WordViewDelegate) {

        self.word = word
        self.delegate = delegate
        super.init(frame: frame)

        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: "nextWord:")
        self.addGestureRecognizer(gestureRecognizer)

        label.text = word.text
        addSubview(label)
    }

    func nextWord(sender: UISwipeGestureRecognizer) {

        let successful = sender.direction == UISwipeGestureRecognizerDirection.Right;

        let attempt = Attempt(success: successful)
        delegate.reportAttempt(attempt)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
