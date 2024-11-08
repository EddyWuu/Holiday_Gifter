//
//  HomeView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-16.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome to Holiday Gifter 🎁")
                .font(.title)
                .padding(.bottom, 20)
            
            // amazon api add later
            Text("Trending Gifts on Amazon")
                .font(.headline)
                .padding(.horizontal)
            
            // dummy
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<5, id: \.self) { index in
                        GiftCardView(title: "Gift Item \(index + 1)", price: "$\(19.99 + Double(index) * 5)", imageName: "gift.fill")
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
    }
}

struct GiftCardView: View {
    let title: String
    let price: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            
            Text(title)
                .font(.subheadline)
                .lineLimit(1)
                .padding(.vertical, 5)
            
            Text(price)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 150)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    HomeView()
}
