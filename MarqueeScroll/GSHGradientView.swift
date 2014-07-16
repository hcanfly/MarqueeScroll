//
//  GSHGradientView.swift
//  ThoughtForDay
//
//  Created by main on 6/21/14.
//  Copyright (c) 2014 Gary.com. All rights reserved.
//

import UIKit


class GSHGradientView: UIView {
	
	init(coder aDecoder: NSCoder!) {
		super.init(coder: aDecoder)
	}

    override func drawRect(rect: CGRect)
    {
		let numLocations :UInt = 2
		let locations :[CGFloat] = [ 0.2, 1.0 ]
		let components :[CGFloat] = [0.0, 0.0, 0.0, 1.0,		// start color
			0.7, 0.3, 1.0, 1.0]									// end color
		
		let rgbColorspace = CGColorSpaceCreateDeviceRGB()
		let glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, numLocations)
		
		let currentbounds = bounds
		let topCenter :CGPoint = CGPointMake(CGRectGetMidX(currentbounds), 0)
		let midCenter :CGPoint = CGPointMake(CGRectGetMidX(currentbounds), currentbounds.size.height)
		
		let currentContext = UIGraphicsGetCurrentContext()
		CGContextDrawLinearGradient(currentContext, glossGradient, topCenter, midCenter, UInt32(kCGGradientDrawsAfterEndLocation))
		
    }
	

}