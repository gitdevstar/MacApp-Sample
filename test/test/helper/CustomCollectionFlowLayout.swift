//
//  CustomCollectionFlowLayout.swift
//  test
//
//  Created by brian on 6/4/21.
//

import Cocoa

class CustomCollectionFlowLayout: NSCollectionViewFlowLayout, NSCollectionViewDelegate {
    func collectionView(collectionView: NSCollectionView,
                        layout collectionViewLayout: NSCollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> NSSize {
        print(self.estimatedItemSize)
        return self.estimatedItemSize
        
//        return CGSize(width: 80, height: 80)
    }
}
