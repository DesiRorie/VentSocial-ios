//
//  VentSocialApp.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/22/23.
//

import SwiftUI

@main
struct VentSocialApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
