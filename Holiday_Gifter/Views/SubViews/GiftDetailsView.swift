//
//  GiftDetailsView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-19.
//

import SwiftUI

struct GiftDetailsView: View {
    
    var recipient: Recipient
    @Binding var showGiftDetails: Bool
    
    var body: some View {
            
        NavigationView {
            List {
                ForEach(recipient.gifts) { gift in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(gift.name)
                                .font(.headline)
                            Text("Price($): \(gift.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            // TODO, to remove from gifts
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showGiftDetails = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Gift Details")
                        .font(.title2)
                        .bold()
                }
            }
        }
    }
}
