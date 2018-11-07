//
//  LCLCardPageCollectionCell.swift
//  LCLCollctionCardPage
//
//  Created by linchl on 2018/11/7.
//  Copyright © 2018年 linchl. All rights reserved.
//

import Foundation
import UIKit

class LCLCardPageCollectionCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    var imageString: String = ""
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.backgroundColor = .gray
        contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let image = UIImage(named: imageString)
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: 256, height: 256)
        imageView.center = contentView.center
    }
}
