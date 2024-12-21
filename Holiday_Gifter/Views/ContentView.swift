//
//  ContentView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-17.
//

import SwiftUI

struct ContentView: View {
    
    let recipientsViewModel = RecipientsViewModel()
    
    var body: some View {
        TabView {
//            HomeView()
//                .tabItem {
//                    Label("Home", systemImage: "house")
//                }
            
            TrackGiftsView(viewModel: recipientsViewModel)
                .tabItem {
                    Label("Track Gifts", systemImage: "gift")
                }
            
            ShoppingListView()
                .tabItem {
                    Label("Shopping List", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    ContentView()
}
