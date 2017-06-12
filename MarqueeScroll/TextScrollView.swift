//
//  TextScrollView.swift
//  ThoughtForDay
//
//  Created by main on 6/20/14.
//  Copyright (c) 2014 Gary.com. All rights reserved.
//

import UIKit


let kSpaceBetweenLabels :CGFloat = 20.0


final class TextScrollView: UIScrollView {
	
    private let fontName = "HelveticaNeue"
    private let fontSize: CGFloat = 36.0
    private var    displayText = "Did we forget to set the text?"
    private var timeToScrollAcrossView: CGFloat = 5.2
    
    
    private func commonInit() {
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.isUserInteractionEnabled = false
        
        self.setScrollRate()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    
    func scroll() {
        let label = subviews[0] as! UILabel
        let animationDuration = TimeInterval((label.frame.size.width / self.frame.size.width) * self.timeToScrollAcrossView)
        let animationDelay = 2.0
        let newOffset = CGPoint(x: label.frame.size.width + kSpaceBetweenLabels, y: 0)
        
        UIView.animate(withDuration: animationDuration, delay: animationDelay, options: ([UIViewAnimationOptions.repeat, UIViewAnimationOptions.beginFromCurrentState, UIViewAnimationOptions.curveLinear]), animations: {self.contentOffset = newOffset}, completion: nil)
    }
    
    func setText(text: String) {
        
        self.displayText = text
        
        var label = self.createLabel()
        
        for v in subviews {
            v.removeFromSuperview()
        }
        
        self.addSubview(label)
        
        self.setContentOffset(CGPoint.zero, animated: true)
        
        var size = CGSize.zero
        
        size.width = label.frame.size.width + self.frame.size.width + kSpaceBetweenLabels
        size.height = self.frame.size.height
        self.contentSize = size
        
        if (label.frame.size.width > self.frame.size.width) {
            // if label is wider than screen add a second label to show while scrolling
            
            label = self.createLabel()
            
            var scrollFrame = label.frame
            scrollFrame.origin.x = label.frame.size.width + kSpaceBetweenLabels
            label.frame = scrollFrame
            
            self.addSubview(label)
            self.scroll()
        } else {
            var scrollCenter = label.center
            scrollCenter.x = center.x - frame.origin.x
            label.center = scrollCenter
        }
        
    }
    
    func createLabel() -> UILabel {
        
        let label = UILabel()
        
        label.text = displayText
        label.font = UIFont(name: fontName, size: fontSize)
        label.textColor = .white
        label.backgroundColor = .clear
        label.sizeToFit()
        
        var labelCenter = label.center
        labelCenter.y = center.y - self.frame.origin.y
        label.center = labelCenter
        
        return label
    }
    
    func setScrollRate() {
        if self.frame.size.width > 700 {
            self.timeToScrollAcrossView = 5.2
        } else {
            self.timeToScrollAcrossView = 3
        }
    }
    
}
