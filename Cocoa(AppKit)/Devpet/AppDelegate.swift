//
//  AppDelegate.swift
//  Devpet
//
//  Created by 강민석 on 2020/10/21.
//

import Cocoa
import RealmSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let popover = NSPopover()
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    var viewController: SnippetsViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("\(#function)")
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("MenuIcon"))
            button.action = #selector(togglePopover(_:))
        }
        
        viewController = SnippetsViewController.instantiateViewController("SnippetsViewController")
        popover.contentViewController = viewController
        popover.behavior = NSPopover.Behavior.semitransient
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
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }

    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
    
//    let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
//        if (oldSchemaVersion < 1) {
//            migration.enumerateObjects(ofType: Snippet.className()) { (oldObject, newObject) in
//                newObject![""]
//            }
//        }
//    })
}
