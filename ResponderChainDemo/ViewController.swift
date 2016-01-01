//
//  ViewController.swift
//  ResponderChainDemo
//
//  Created by dasdom on 29.12.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

class ViewWithButtonAndLabel: UIView {
    
    let button: UIButton
    let label: UILabel
    
    override init(frame: CGRect) {
        label = UILabel()
        label.textAlignment = .Center
        label.text = "Touch the button"

        button = UIButton(type: .System)
        button.setTitle("The Button", forState: .Normal)
        button.addTarget(nil, action: "onButtonTap:", forControlEvents: .TouchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .Vertical
        
        super.init(frame: frame)
        
        backgroundColor = .yellowColor()
        
        addSubview(stackView)
        
        stackView.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        stackView.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ViewController: UIViewController {
    
    let viewWithButtonAndLabel = ViewWithButtonAndLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        
        view.addSubview(viewWithButtonAndLabel)

        viewWithButtonAndLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["subView": viewWithButtonAndLabel]
        var layoutConstraints = [NSLayoutConstraint]()
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|-20-[subView]-20-|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[subView]-20-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(layoutConstraints)
        
    }

    func onButtonTap(sender: UIButton) {
        viewWithButtonAndLabel.label.text = viewWithButtonAndLabel.label.text == "Yeah!" ? "Touch the button" : "Yeah!"
    }
}

