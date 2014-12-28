//
//  TZAutoGrowingTextView.swift
//  TZAutoGrowingTextView
//
//  Created by Thomas Zhao on 12/28/14.
//  Copyright (c) 2014 thomasrzhao. All rights reserved.
//

import UIKit

public class TZAutoGrowingTextView: UITextView {

    private let contentSizeKeyPath = "contentSize";
    private var kvoContext = UInt8();
    
    public override init(frame: CGRect) {
        super.init(frame: frame);
        commonInit();
    }

    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        commonInit();
    }
    
    private func commonInit() {
        super.addObserver(self, forKeyPath: contentSizeKeyPath, options: .Initial | .New, context: &kvoContext);
    }
    
    deinit {
        super.removeObserver(self, forKeyPath: contentSizeKeyPath, context: &kvoContext);
    }
    
    public override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        switch(keyPath, context) {
        case(contentSizeKeyPath, &kvoContext) :
            invalidateIntrinsicContentSize();
            layoutIfNeeded();
            scrollRangeToVisible(selectedRange);
        default: super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context);
        }
    }
    
    public override func intrinsicContentSize() -> CGSize {
        return contentSize;
    }
    
}
