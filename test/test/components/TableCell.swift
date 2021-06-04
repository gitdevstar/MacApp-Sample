//
//  TableCell.swift
//  test
//
//  Created by brian on 6/3/21.
//

import Cocoa

class TableCell: NSTableCellView {
    @IBOutlet weak var lbTitle: NSTextField!
    @IBOutlet weak var lbDate: NSTextField!
    @IBOutlet weak var lbDescription: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        self.layer?.borderWidth = 1
        self.layer?.borderColor = .white
    }
}
