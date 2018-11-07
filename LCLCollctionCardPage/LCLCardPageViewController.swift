//
//  LCLCardPageViewController.swift
//  LCLCollctionCardPage
//
//  Created by linchl on 2018/11/7.
//  Copyright © 2018年 linchl. All rights reserved.
//

import Foundation
import UIKit

public let ScreenWidth = UIScreen.main.bounds.size.width
public let ScreenHeight = UIScreen.main.bounds.size.height
public let ScreenScale  = UIScreen.main.scale

class LCLCardPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let layout = TransformCardFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 70)
        layout.minimumInteritemSpacing = 0.00001
        layout.minimumLineSpacing = 0.00001
        layout.itemSize = CGSize(width: 256, height: 256)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: ScreenHeight / 2 - 128, width: ScreenWidth, height: 256), collectionViewLayout: layout)
        collectionView.register(LCLCardPageCollectionCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        view.addSubview(collectionView)
    }
}

extension LCLCardPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LCLCardPageCollectionCell
        cell.imageString = "\(indexPath.row + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 256, height: 256)
    }
}
