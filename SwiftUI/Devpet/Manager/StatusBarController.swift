//
//  StatusBarController.swift
//  Devpet
//
//  Created by 강민석 on 2021/02/26.
//

import AppKit

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var popover: NSPopover
    
    init(_ popover: NSPopover) {
        self.popover = popover
        statusBar = .init()
        statusItem = statusBar.statusItem(withLength: 28.0)
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("MenuIcon"))
            button.image?.isTemplate = true
            
            button.action = #selector(togglePopover(sender:))
            button.target = self
        }
    }
    
    @objc func togglePopover(sender: AnyObject) {
        if popover.isShown {
            hidePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    
    func showPopover(_ sender: AnyObject) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
        }
    }
    
    func hidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
    }
}
