//
//  OnboardingPageView.swift
//  Heart to Heart
//
//  Created by Ben Clarke on 15/02/2025.
//

import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage
    let isFirstPage: Bool
    
    @State private var showImage = false
    @State private var showText = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .accessibility(hidden: true)
                .opacity(isFirstPage ? (showImage ? 1 : 0) : 1)
                .animation(isFirstPage ? .spring(duration: 1.0).delay(1.0) : .none, value: showImage)

            
            Text(page.title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .opacity(isFirstPage ? (showText ? 1 : 0) : 1)
                .offset(y: isFirstPage ? (showText ? 0 : 20) : 0)
                .animation(isFirstPage ? .easeOut(duration: 1.0).delay(1.0) : .none, value: showText)
            
            
            Text(page.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .opacity(isFirstPage ? (showText ? 1 : 0) : 1)
                .offset(y: isFirstPage ? (showText ? 0 : 20) : 0)
                .animation(isFirstPage ? .easeOut(duration: 1.0).delay(1.0) : .none, value: showText)
            
            
            Spacer()
        }
        .padding()
        .onAppear {
            if isFirstPage {
                showImage = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    showText = true
                }
            }
        }
    }
}
