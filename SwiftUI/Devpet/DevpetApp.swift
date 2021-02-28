//
//  DevpetApp.swift
//  Devpet
//
//  Created by 강민석 on 2021/02/28.
//

import SwiftUI

@main
struct DevpetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
