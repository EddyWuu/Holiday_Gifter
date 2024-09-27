//
//  AddGiftSheetView.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-27.
//

import SwiftUI

struct AddGiftSheetView: View {
    var recipient: Recipient
    @State private var giftName: String = ""
    @State private var giftPrice: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Gift Name", text: $giftName)
                TextField("Gift Price", text: $giftPrice)
            }
            .navigationBarTitle("Add Gift")
        }
    }
}
