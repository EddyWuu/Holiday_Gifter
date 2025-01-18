//
//  AddGiftSheetView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-27.
//

import SwiftUI

struct AddGiftSheetView: View {
    
    @ObservedObject var viewModel: RecipientsViewModel
    var recipient: Recipient
    @State private var giftName: String = ""
    @State private var giftPrice: Double? = nil
    @Environment(\.dismiss) var dismiss
    
    private var priceFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Gift Details")) {
                    TextField("Gift Name", text: $giftName)
                    TextField("Gift Price", value: $giftPrice, formatter: priceFormatter)
                }
            }
            .navigationBarTitle("Add Gift", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addGift(Gift(name: giftName, price: giftPrice ?? 0.0), to: recipient)
                        dismiss()
                    }
                    .disabled(giftName.isEmpty || giftPrice == nil || (giftPrice ?? 0.0) <= 0.0)
                }
            }
        }
    }
}
