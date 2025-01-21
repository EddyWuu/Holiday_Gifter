//
//  ShoppingListView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-17.
//

import SwiftUI

struct ShoppingListView: View {
    
    @State private var budget: Double = 0.0 // placeholder
    @State private var spending: Double = 200.0
    
    var body: some View {
        VStack {
            
            // progress wheel
            VStack {
                SpendingsCircleView(budget: budget, spending: spending)
                    .frame(width: 500, height: 300)
                    .padding()
                
                // budget and spendings
                VStack {
                    Text("Spending: $\(spending, specifier: "%.2f")")
                        .font(.headline)
                    Text("Budget: $\(budget, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 30)
            }
            
            Spacer()
            
            // button to adjsut
            Button(action: {

            }) {
                Label("Adjust Budget", systemImage: "plus.circle")
                    .padding()
                    .background(Color.green.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 10)
        }
    }
}

struct SpendingsCircleView: View {
    
    var budget: Double
    var spending: Double
    
    var progress: Double {
        
        guard budget > 0 else { return 0 }
        return min(spending / budget, 1.0)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let radius = min(width, height) / 2
            let center = CGPoint(x: width / 2, y: height)
            
            ZStack {
                // arc of budget
                Path { path in
                    path.addArc(center: center,
                                radius: radius,
                                startAngle: .degrees(-210),
                                endAngle: .degrees(30),
                                clockwise: false)
                }
                .stroke(Color.gray.opacity(0.3), lineWidth: 20)
                
                // filled arc of spent
                Path { path in
                    path.addArc(center: center,
                                radius: radius,
                                startAngle: .degrees(-210),
                                endAngle: .degrees(-210 + 240 * progress),
                                clockwise: false)
                }
                .stroke(Color.green, lineWidth: 20)
                
                // center spendings
                VStack {
                    Text("$\(spending, specifier: "%.2f")")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("of $\(budget, specifier: "%.2f") spent")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 100)
                .offset(y: radius / 2)
            }
        }
    }
}
