//
//  DevpetApp.swift
//  Devpet
//
//  Created by 강민석 on 2021/02/24.
//

import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var popover = NSPopover()
    var statusBar: StatusBarController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        popover.contentSize = NSSize(width: 360, height: 360)
        popover.contentViewController = NSHostingController(rootView: ContentView())
        
        statusBar = StatusBarController(popover)
    }
}

@main
struct DevpetApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
        }
    }
}
