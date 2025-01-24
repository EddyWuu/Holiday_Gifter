//
//  ShoppingListView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-17.
//

import SwiftUI

struct ShoppingListView: View {
    
    @ObservedObject var viewModel: RecipientsViewModel
    @State private var isShowingChangeBudget: Bool = false
    
    var body: some View {
        VStack {
            
            // progress wheel
            VStack {
                SpendingsCircleView(budget: viewModel.overallBudget, spending: viewModel.totalSpending)
                    .frame(width: 500, height: 300)
                    .padding()
                
                // budget and spendings
                VStack {
                    Text("Spending: $\(viewModel.totalSpending, specifier: "%.2f")")
                        .font(.headline)
                    Text("Budget: $\(viewModel.overallBudget, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 30)
            }
            
            Spacer()
            
            // button to adjsut
            Button(action: {
                isShowingChangeBudget = true
            }) {
                Label("Adjust Budget", systemImage: "plus.circle")
                    .font(.headline)
                    .padding()
                    .background(Color.green.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isShowingChangeBudget, content: {
            ChangeBudgetSheetView(viewModel: viewModel, isPresented: $isShowingChangeBudget)
        })
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
            let endAngle = -210 + 240 * progress
            let endPoint = CGPoint(
                x: center.x + radius * cos(endAngle * .pi / 180),
                y: center.y + radius * sin(endAngle * .pi / 180)
            )
            
            ZStack {
                // arc of budget
                Path { path in
                    path.addArc(center: center,
                                radius: radius,
                                startAngle: .degrees(-210),
                                endAngle: .degrees(30),
                                clockwise: false)
                }
                .stroke(Color.green.opacity(0.3), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                
                // filled arc of spent
                Path { path in
                    path.addArc(center: center,
                                radius: radius,
                                startAngle: .degrees(-210),
                                endAngle: .degrees(-210 + 240 * progress),
                                clockwise: false)
                }
                .stroke(Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                    .position(x: center.x + radius * cos(-210 * .pi / 180),
                              y: center.y + radius * sin(-210 * .pi / 180))
                
                if progress > 0 {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 20, height: 20)
                        .position(endPoint)
                }
                
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
