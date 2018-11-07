//
//  ShowMoreButtonView.swift
//  LCLCollctionCardPage
//
//  Created by linchl on 2018/11/7.
//  Copyright © 2018年 linchl. All rights reserved.
//

import Foundation
import UIKit

class ShowMoreButtonView: UIView {
    private let label = UILabel()
    private let arrowImageView = UIImageView(image: UIImage(named: "arrow"))
    private var arrowAngle = -Double.pi
    
    private let arrowView: UIView = {
        let arrowView = UIView()
        arrowView.layer.cornerRadius = 6
        arrowView.layer.borderWidth = 0.5
        arrowView.layer.borderColor = UIColor(red: 151 / 255, green: 151 / 255, blue: 151 / 255, alpha: 1).cgColor
        return arrowView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(arrowView)
        
        arrowView.addSubview(arrowImageView)
        arrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat(arrowAngle))
        
        label.numberOfLines = 6
        
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        arrowView.frame = CGRect(x: 0, y: self.center.y - 6, width: 12, height: 12)
        
        arrowImageView.frame = CGRect(x: 2.5, y: 2.5, width: 7, height: 7)
        
        label.frame = CGRect(x: arrowView.frame.size.width + 6.5, y: arrowView.center.y - self.frame.height / 2, width: 16, height: self.frame.height)
    }
    
    func updateLabelText(_ string: String) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 3.5
        
        let attrString = NSMutableAttributedString(attributedString: NSAttributedString(string: string, attributes: [NSAttributedString.Key.font : UIFont(name: ".HelveticaNeueInterface-Light", size: 13) ?? UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor(red: 136 / 255, green: 136 / 255, blue: 136 / 255, alpha: 1), NSAttributedString.Key.paragraphStyle : style]))
        
        label.attributedText = attrString
    }
    
    func updateIcon() {
        arrowAngle += Double.pi
        UIView.animate(withDuration: 0.3) {
            self.arrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat(self.arrowAngle))
        }
    }
}
