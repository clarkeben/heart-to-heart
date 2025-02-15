//
//  ContentView.swift
//  Heart to Heart
//
//  Created by Ben Clarke on 15/02/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @AppStorage(K.UserDefaultKeys.showOnboarding) var showOnboarding: Bool = true
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
        }.fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
}
