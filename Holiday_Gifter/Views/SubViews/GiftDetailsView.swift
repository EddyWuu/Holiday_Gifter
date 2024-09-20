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
            VStack {
                ForEach(recipient.gifts) { gift in
                    Text("\(gift.name)")
                    Text("\(gift.price)")
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
