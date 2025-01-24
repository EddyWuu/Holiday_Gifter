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
    @State private var showAddRecipientSheet = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(viewModel.recipients) { recipient in
                    NavigationLink(destination: GiftDetailsView(viewModel: viewModel, recipient: recipient)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(recipient.name)
                                    .font(.headline)
                                
                                Text("Gifts: \(recipient.gifts.count)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()

                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                viewModel.removeRecipient(recipient)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                
                // button for adding recipient
                Button(action: {
                    showAddRecipientSheet = true
                }) {
                    Label("Add Recipient", systemImage: "person.badge.plus")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Giftees")
            .sheet(isPresented: $showAddRecipientSheet) {
                AddRecipientView(viewModel: viewModel)
            }
        }
    }
}

