//
//  GSHGradientView.swift
//  ThoughtForDay
//
//  Created by main on 6/21/14.
//  Copyright (c) 2014 Gary.com. All rights reserved.
//

import UIKit


final class GSHGradientView: UIView {
	
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect)
    {
        var locations: [CGFloat] = [ 0.2, 1.0 ]
        var components: [CGFloat] = [0.0, 0.0, 0.0, 1.0,        // start color
            0.7, 0.3, 1.0, 1.0]                                    // end color
        
        let rgbColorspace = CGColorSpaceCreateDeviceRGB()
        let glossGradient = CGGradient(colorSpace: rgbColorspace, colorComponents: &components, locations: &locations, count: 2)
        
        let currentbounds = self.bounds
        let topCenter = CGPoint(x: currentbounds.midX, y: 0)
        let midCenter = CGPoint(x: currentbounds.midX, y: currentbounds.size.height)
        
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext!.drawLinearGradient(glossGradient!, start: topCenter, end: midCenter, options: .drawsAfterEndLocation)
        
    }

}
