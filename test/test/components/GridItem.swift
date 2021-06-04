//
//  GridItem.swift
//  test
//
//  Created by brian on 6/3/21.
//

import Cocoa

class GridItem: NSCollectionViewItem {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
     
        view.wantsLayer = true
        view.layer?.cornerRadius = 8.0
        view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
    }
    
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
     
            if isSelected {
                view.layer?.backgroundColor = NSColor.selectedControlColor.cgColor
                self.selectView?()
            } else {
                view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
            }
            
            
        }
    }
    
    var selectView: (() -> ())?
    
}
