//
//  AppDelegate.swift
//  Devpet
//
//  Created by 강민석 on 2021/02/28.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    let persistenceController = PersistenceController.shared
    var application: NSApplication = NSApplication.shared
    var myProperty: String = ""
    
    var popover = NSPopover()
    var statusBar: StatusBarController?
    
    override init() {
        // Further customization if needed.
        super.init()
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        popover.contentSize = NSSize(width: 200, height: 300)
        popover.contentViewController = NSHostingController(rootView: SnippetsView()
                                                                .environment(\.managedObjectContext, persistenceController.container.viewContext))
        
        statusBar = StatusBarController(popover)
    }
}
