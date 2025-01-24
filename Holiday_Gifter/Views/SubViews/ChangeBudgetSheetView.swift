//
//  ChangeBudgetSheetView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2025-01-23.
//

import SwiftUI

struct ChangeBudgetSheetView: View {
    
    @ObservedObject var viewModel: RecipientsViewModel
    @Binding var isPresented: Bool
    @State private var newBudget: String = ""
    
    var body: some View {
        
        NavigationView {
            
        
            VStack(spacing: 20) {
                
                Spacer()
                
                Text("Adjust Budget")
                    .font(.title2)
                    .fontWeight(.bold)
                
                TextField("Enter new budget", text: $newBudget)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
                
                Button(action: {
                    if let updatedBudget = Double(newBudget), updatedBudget >= 0 {
                        viewModel.overallBudget = updatedBudget
                        isPresented = false
                    }
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationBarItems(leading: Button("Cancel") {
                isPresented = false
            })
        }
    }
}
