//
//  ShoppingListView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-17.
//

import SwiftUI

struct ShoppingListView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! This is a SwiftUI app, overview.")
            
            Button(action: {
                
            }) {
                Label("Set Budget", systemImage: "gear")
            }
            
        }
        .padding()
    }
}
