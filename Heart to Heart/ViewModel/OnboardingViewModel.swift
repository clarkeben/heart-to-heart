//
//  OnboardingViewModel.swift
//  Heart to Heart
//
//  Created by Ben Clarke on 15/02/2025.
//

import SwiftUI

@Observable
class OnboardingViewModel {
    var pages: [OnboardingPage] = [
           OnboardingPage(
               title: "Welcome to Heart to Heart",
               description: "Deepen your connection and spark meaningful conversations with our interactive conversation cards.",
               imageName: K.Images.couple
           ),
           OnboardingPage(
               title: "How to Play",
               description: "Take turns drawing a card, read the prompt, and share your thoughts. Enjoy surprises with wild cards!",
               imageName: K.Images.heartEnvelope
           ),
           OnboardingPage(
               title: "Get Connected",
               description: "Customize your experience, choose categories, and begin your journey to a deeper connection!",
               imageName: K.Images.heart
           )
       ]
       
       // The current page index
       var currentPage: Int = 0
}

