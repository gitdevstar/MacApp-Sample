//
//  NSTextField.swift
//  test
//
//  Created by brian on 6/4/21.
//

import Cocoa

extension NSTextField {
func bestheight(text: String, width: CGFloat) -> CGFloat {

    self.stringValue = text
    let getnumber = self.cell!.cellSize(forBounds: NSMakeRect(CGFloat(0.0), CGFloat(0.0), width, CGFloat(FLT_MAX))).height

    return getnumber
   }
}

extension NSTextField {
func bestwidth(text: String, height: CGFloat) -> CGFloat {

    self.stringValue = text
    let getnumber = self.cell!.cellSize(forBounds: NSMakeRect(CGFloat(0.0), CGFloat(0.0), CGFloat(FLT_MAX), height)).width

    return getnumber
   }
}
