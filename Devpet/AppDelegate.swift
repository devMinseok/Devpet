//
//  AppDelegate.swift
//  Devpet
//
//  Created by 강민석 on 2020/10/21.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let popover = NSPopover()
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    var viewController: SnippetsViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("\(#function)")
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("MenuIcon"))
            button.action = #selector(togglePopover(_:))
        }
        
        viewController = SnippetsViewController.freshController()
        popover.contentViewController = viewController
        popover.behavior = NSPopover.Behavior.semitransient
        
        if !popover.isShown {
            showPopover(sender: self)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
//        viewController.freeAuthorizationRef()
    }

    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }

    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }

    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
}
