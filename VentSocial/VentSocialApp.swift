//
//  VentSocialApp.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/22/23.
//

import SwiftUI

@main
struct VentSocialApp: App {
    @AppStorage("isOnboarding") private var isOnboarding:Bool = true
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
                
            }
            else {
              MainView()
            }

        }
    }
}



//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
