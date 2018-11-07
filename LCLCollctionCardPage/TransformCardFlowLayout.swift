//
//  TransformCardFlowLayout.swift
//  Meipu
//
//  Created by linchl on 2018/9/26.
//  Copyright © 2018年 Xiamen Meitu Technology Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

class TransformCardFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let original = super.layoutAttributesForElements(in: rect) else {
            return super.layoutAttributesForElements(in: rect)
        }

        guard let attsArray = NSMutableArray(array: original, copyItems: true) as? [UICollectionViewLayoutAttributes] else {
            return original
        }

        guard let left = collectionView?.contentOffset.x else {
            return original
        }
        
        let count = attsArray.count
        if count > 0, let collectionView = collectionView {
            for i in 0..<(count - 1) {
                let atts = attsArray[i]
                let diff: CGFloat = abs(atts.frame.origin.x - left - 20)
                let scale : CGFloat = 0.9 + 0.1 * (1 - min(1, diff / atts.size.width))
                atts.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            
            // 最后一个cell不会停在屏幕左边20pt的位置，要单独处理，保证停下的时候是最大的尺寸
            let atts = attsArray[count - 1]
            let maxLeftMargin: CGFloat = collectionView.contentSize.width - collectionView.contentInset.right - atts.size.width
            let diff: CGFloat = abs(atts.frame.origin.x - maxLeftMargin)
            let scale : CGFloat = 0.9 + 0.1 * (1 - min(1, diff / atts.size.width))
            atts.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        return attsArray
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return proposedContentOffset
        }
        
        let rect = CGRect(origin: CGPoint(x: proposedContentOffset.x, y: 0), size: collectionView.frame.size)
        
        guard let original = super.layoutAttributesForElements(in: rect) else {
            return proposedContentOffset
        }
        
        guard let attsArray = NSMutableArray(array: original, copyItems: true) as? [UICollectionViewLayoutAttributes] else {
            return proposedContentOffset
        }
        
        let left: CGFloat = proposedContentOffset.x + 20
        var minSpace: CGFloat = CGFloat(MAXFLOAT)
        for atts in attsArray {
            if abs(minSpace) > abs(atts.frame.origin.x - left) {
                minSpace = atts.frame.origin.x - left
            }
        }
        
        return CGPoint(x: proposedContentOffset.x + minSpace, y: proposedContentOffset.y)
    }
}
