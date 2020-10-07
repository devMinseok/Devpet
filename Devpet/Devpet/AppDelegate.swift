//
//  AppDelegate.swift
//  Devpet
//
//  Created by 강민석 on 2020/10/07.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover = NSPopover()
    
//    var viewController: PortScannerViewController!
    
//    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        print("\(#function)")
//
//        // set menu bar icon & popover view
//        if let button = statusItem.button {
//            button.image = NSImage(named:NSImage.Name("Command"))
//            button.action = #selector(togglePopover(_:))
//        }
//
//        viewController = PortScannerViewController.freshController()
//        popover.contentViewController = viewController
//        popover.behavior = NSPopover.Behavior.semitransient
//
//        viewController.checkHelperVersionAndUpdateIfNecessary { installed in
//            if !installed {
//                self.viewController.installHelperDaemon()
//            }
//            // Create an empty authorization reference
//            self.viewController.initAuthorizationRef()
//        }
//
//        if !popover.isShown {
//            showPopover(sender: self)
//        }
//    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("Command"))
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = SnippetViewController.freshController()
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

