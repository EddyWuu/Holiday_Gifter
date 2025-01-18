//
//  GiftDetailsView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-19.
//

import SwiftUI

struct GiftDetailsView: View {
    
    @ObservedObject var viewModel: RecipientsViewModel
    var recipient: Recipient
    @State private var addGiftSheet: Bool = false
    
    var body: some View {
            
        NavigationView {
            VStack {
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
                                viewModel.removeGift(gift, from: recipient)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button(action: {
                    addGiftSheet = true
                }) {
                    Text("Add Gift")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $addGiftSheet) {
            AddGiftSheetView(viewModel: viewModel, recipient: recipient)
        }
    }
}
