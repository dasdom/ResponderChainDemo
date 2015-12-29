//
//  ViewController.swift
//  ResponderChainDemo
//
//  Created by dasdom on 29.12.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

class ViewWithButton: UIView {
    
    let button: UIButton
    
    override init(frame: CGRect) {
        button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("The Button", forState: .Normal)
        button.addTarget(nil, action: "onButtonTap:", forControlEvents: .TouchUpInside)
        
        super.init(frame: frame)
        
        backgroundColor = .yellowColor()
        
        addSubview(button)
        
        button.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        button.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ViewController: UIViewController {
    
    let viewWithButton = ViewWithButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(viewWithButton)
    }

    func onButtonTap(sender: UIButton) {
        print("This button was clicked in the subview!")
    }
}

