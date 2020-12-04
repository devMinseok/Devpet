//
//  NSView.swift
//  Devpet
//
//  Created by 강민석 on 2020/12/04.
//

import Cocoa

extension NSView {
    /**
     Take a snapshot of a current state NSView and return an NSImage
     
     - returns: NSImage representation
     */
    func snapshot() -> NSImage {
        let pdfData = dataWithPDF(inside: bounds)
        let image = NSImage(data: pdfData)
        return image ?? NSImage()
    }
}
