//
//  ViewController.swift
//  MarqueeScroll
//
//  Created by main on 6/27/14.
//  Copyright (c) 2014 Gary.com. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {
                            
    private var scrollLabel: TextScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)    // also have to add "View controller-based status bar appearance" to plist, set to NO
        
        let gradientView = GSHGradientView(frame: self.view.bounds)
        self.view.addSubview(gradientView)
        
        self.scrollLabel = TextScrollView(frame: self.calcScrollViewFrameBounds())
        self.scrollLabel.setText(text: "Hello, my name is Enigo Montoya. You killed my father, prepare to die.")
        self.view.addSubview(self.scrollLabel)
    }
    
    private func calcScrollViewFrameBounds() -> CGRect {
        var desiredBounds = self.view.bounds
        
        if desiredBounds.size.height > 700  {
            desiredBounds.origin.y = 150.0
        } else {
            desiredBounds.origin.y = 80.0
        }
        desiredBounds.size.height = 60.0
        
        return desiredBounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

