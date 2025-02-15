//
//  AnimationTest.swift
//  Heart to Heart
//
//  Created by Ben Clarke on 15/02/2025.
//

import SwiftUI

import SwiftUI

struct LoveLetterAnimationView: View {
    @State private var showHeart = false
    @State private var heartScale: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            // Envelope
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 250, height: 150)
                
                Triangle()
                    .fill(Color.gray.opacity(0.6))
                    .frame(width: 250, height: 150)
                    
            }
            
            // Heart
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
                .foregroundColor(.red)
                .opacity(showHeart ? 1 : 0)
                .scaleEffect(heartScale)
                .animation(.easeIn(duration: 0.5), value: showHeart)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5), value: heartScale)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showHeart = true
                withAnimation {
                    heartScale = 1.2
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    heartScale = 1.0
                }
            }
        }
    }
}

// Triangle Shape for the Envelope Flap
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct LoveLetterAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoveLetterAnimationView()
    }
}
