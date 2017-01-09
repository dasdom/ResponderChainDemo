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
        label.textAlignment = .center
        label.text = "Touch the button"

        button = UIButton(type: .system)
        button.setTitle("The Button", for: UIControlState())
        button.addTarget(nil, action: .onButtonTap, for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ViewController: UIViewController {
    
    let viewWithButtonAndLabel = ViewWithButtonAndLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(viewWithButtonAndLabel)

        viewWithButtonAndLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["subView": viewWithButtonAndLabel]
        var layoutConstraints = [NSLayoutConstraint]()
        layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|-20-[subView]-20-|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[subView]-20-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(layoutConstraints)
        
    }

    func onButtonTap(_ sender: UIButton) {
        viewWithButtonAndLabel.label.text = viewWithButtonAndLabel.label.text == "Yeah!" ? "Touch the button" : "Yeah!"
    }
}

fileprivate extension Selector {
    static let onButtonTap = #selector(ViewController.onButtonTap(_:))
}
