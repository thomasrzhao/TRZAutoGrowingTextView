//
//  TRZAutoGrowingTextView.swift
//  TRZAutoGrowingTextView
//
//  Created by Thomas Zhao on 12/28/14.
//  Copyright (c) 2014 thomasrzhao. All rights reserved.
//

import UIKit

@IBDesignable
public class TRZAutoGrowingTextView: UITextView {

    private let contentSizeKeyPath = "contentSize"
    private var kvoContext = UInt8()
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        super.addObserver(self, forKeyPath: contentSizeKeyPath, options: [.Initial, .New], context: &kvoContext)
    }
    
    public override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        switch(keyPath, context) {
        case (contentSizeKeyPath?, &kvoContext):
            invalidateIntrinsicContentSize()
            layoutIfNeeded()
            if isFirstResponder() {
                scrollRangeToVisible(selectedRange)
            }
        default: super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }
    
    public override func intrinsicContentSize() -> CGSize {
        return contentSize
    }
    
    deinit {
        super.removeObserver(self, forKeyPath: contentSizeKeyPath, context: &kvoContext)
    }
}
