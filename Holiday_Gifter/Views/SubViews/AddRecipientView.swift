//
//  AddRecipientView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2025-01-17.
//

import SwiftUI

struct AddRecipientView: View {
    
    @ObservedObject var viewModel: RecipientsViewModel
    @Environment(\.dismiss) var dismiss
    @State private var recipientName: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipient Name")) {
                    TextField("Enter name", text: $recipientName)
                }
            }
            .navigationTitle("Add Recipient")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // add the recipient to vm
                        if !recipientName.isEmpty {
                            viewModel.addRecipient(name: recipientName)
                            dismiss()
                        }
                    }
                    .disabled(recipientName.isEmpty)
                }
            }
        }
    }
}
