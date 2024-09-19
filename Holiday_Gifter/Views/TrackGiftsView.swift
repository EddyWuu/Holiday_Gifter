//
//  TrackGiftsView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-17.
//

import SwiftUI

struct TrackGiftsView: View {
    
    @ObservedObject var viewModel: RecipientsViewModel
    @State var newRecipientName: String = ""
    @State var selectedRecipient: Recipient?
    @State var showGiftSheet = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(viewModel.recipients) { recipient in
                    Button(action: {
                        selectedRecipient = recipient
                        showGiftSheet = true
                    }) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(recipient.name)
                                    .font(.headline)
                                
                                Text("Gifts: \(recipient.gifts.count)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Giftees")
        }
    }
}

#Preview {
    TrackGiftsView(viewModel: RecipientsViewModel())
    
}
