//
//  OnboardingView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/22/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isAnimating:Bool = false
    
    @AppStorage("isOnboarding") private var isOnboarding:Bool?
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                Text("Vent")
                    .font(.system(size: 100))
                    .opacity(isAnimating ? 1 : 0)
                Text("Social")
                    .font(.system(size: 100))
                    .opacity(isAnimating ? 1 : 0)
            }            .onAppear{
                withAnimation(.easeOut(duration: 2)){
                    isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                 isOnboarding = false
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

