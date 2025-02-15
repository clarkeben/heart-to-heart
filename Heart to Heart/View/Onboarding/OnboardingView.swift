//
//  OnboardingView.swift
//  Heart to Heart
//
//  Created by Ben Clarke on 15/02/2025.
//

import SwiftUI



struct OnboardingView: View {
    // MARK: - Properties
    @State private var viewModel = OnboardingViewModel()
    @AppStorage(K.UserDefaultKeys.showOnboarding) var showOnboarding: Bool = true
        
    
    // MARK: - Body
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentPage) {
                ForEach(0..<viewModel.pages.count) { index in
                    OnboardingPageView(page: viewModel.pages[index], isFirstPage: index == 0)
                                   .tag(index)
                           }
                       }
                       .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                       .animation(.easeInOut, value: viewModel.currentPage)
                       
                      
                       HStack {
                           if viewModel.currentPage < viewModel.pages.count - 1 {
                               Button(action: {
                                   withAnimation {
                                       viewModel.currentPage += 1
                                   }
                               }) {
                                   Text("Next")
                                       .font(.headline)
                                       .foregroundColor(.white)
                                       .padding()
                                       .frame(maxWidth: .infinity)
                                       .background(Color.pink.opacity(0.5))
                                       .cornerRadius(10)
                               }
                           } else {
                               Button(action: {
                                   showOnboarding = false
                               }) {
                                   Text("Get Started")
                                       .font(.headline)
                                       .foregroundColor(.white)
                                       .padding()
                                       .frame(maxWidth: .infinity)
                                       .background(Color.pink.opacity(0.8))
                                       .cornerRadius(10)
                               }
                           }
                       }
                       .padding(.horizontal)
                       .padding(.bottom, 20)
        }
    }
}

#Preview {
    OnboardingView()
}
