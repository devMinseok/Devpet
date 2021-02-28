//
//  DevpetApp.swift
//  Devpet
//
//  Created by 강민석 on 2021/02/28.
//

import SwiftUI

@main
struct DevpetApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        // Customize delegate here.
        appDelegate.myProperty = ""
    }
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
