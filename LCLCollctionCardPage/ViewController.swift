//
//  ViewController.swift
//  LCLCollctionCardPage
//
//  Created by linchl on 2018/11/7.
//  Copyright © 2018年 linchl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let clickButton: UIButton = {
        let button = UIButton()
        button.setTitle("click me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(ViewController.clickAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(clickButton)
        clickButton.frame = CGRect(x: ScreenWidth / 2 - 50, y: ScreenHeight / 2 - 25, width: 100, height: 50)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc private func clickAction() {
        navigationController?.pushViewController(LCLCardPageViewController(), animated: true)
    }

}

