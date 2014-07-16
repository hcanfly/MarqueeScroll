//
//  TextScrollView.swift
//  ThoughtForDay
//
//  Created by main on 6/20/14.
//  Copyright (c) 2014 Gary.com. All rights reserved.
//

import UIKit


let kSpaceBetweenLabels :CGFloat = 20.0
var timeToScrollAcrossView :CGFloat = 5.2


class TextScrollView: UIScrollView {
	
	//var fontName :String = "HelveticaNeue"
	//var fontSize :CGFloat = 40.0
	var	displayText :String = "Did we forget to set the text?"
	

	func commonInit() {
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
		userInteractionEnabled = false
		
		setScrollRate()
	}
	
    init(frame: CGRect) {
		super.init(frame: frame)
		
		commonInit()
    }

	
	func scroll() {
		let label :UILabel = subviews[0] as UILabel
		
		let animationDuration : NSTimeInterval = Double((label.frame.size.width / frame.size.width) * timeToScrollAcrossView)
		let animationDelay : NSTimeInterval = 2.0
		let newOffset :CGPoint = CGPoint(x: label.frame.size.width + kSpaceBetweenLabels, y: 0)
		UIView.animateWithDuration(animationDuration, delay: animationDelay, options: (UIViewAnimationOptions.Repeat | UIViewAnimationOptions.BeginFromCurrentState | UIViewAnimationOptions.CurveLinear), animations: {self.contentOffset = newOffset}, completion: nil)
	}

	func setText(text:String) {

		displayText = text
		
		var label = createLabel()
		
		for v: AnyObject in subviews {
			v.removeFromSuperview()
		}
		
		addSubview(label)
		
		setContentOffset(CGPoint.zeroPoint, animated: true)
		
		var size = CGSize.zeroSize
		
		size.width = label.frame.size.width + frame.size.width + kSpaceBetweenLabels
		size.height = frame.size.height
		contentSize = size
		
		if (label.frame.size.width > frame.size.width) {
			// if label is wider than screen add a second label to show while scrolling
			
			label = createLabel()
			
			var scrollFrame = label.frame
			scrollFrame.origin.x = label.frame.size.width + kSpaceBetweenLabels
			label.frame = scrollFrame
			
			addSubview(label)
			scroll()
		} else {
			var scrollCenter = label.center
			scrollCenter.x = center.x - frame.origin.x
			label.center = scrollCenter
		}
		
	}
	
	func createLabel() -> UILabel {
		
		var label = UILabel()
		
		label.text = displayText
		label.font = UIFont.systemFontOfSize(48)
		//label.font = UIFont(name: fontName, size: fontSize)
		label.textColor = UIColor.whiteColor()
		label.backgroundColor = UIColor.clearColor()
		label.sizeToFit()
		
		var labelCenter = label.center
		labelCenter.y = center.y - frame.origin.y
		label.center = labelCenter
		
		return label
	}
	
	/*
	func setFontFamily(newFontFamily:String, newFontSize:Float) {
		
		fontFamily = newFontFamily
		fontSize = newFontSize
		
	}
	*/
	
	func setScrollRate() {
		if (frame.size.width > 700) {
			timeToScrollAcrossView = 5.2
		} else {
			timeToScrollAcrossView = 3
		}
	}
}
