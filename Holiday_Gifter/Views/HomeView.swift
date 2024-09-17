//
//  HomeView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-16.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! This is a SwiftUI app, Home.")
        }
        .padding()
    }
}

#Preview {
    HomeView()
}