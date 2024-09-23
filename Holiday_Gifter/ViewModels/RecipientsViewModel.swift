//
//  recipientsViewModel.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-18.
//

import Foundation

class RecipientsViewModel: ObservableObject {
    
    // initialize array of recipients with Recipient model, empty
    @Published var recipients: [Recipient] = [
            Recipient(name: "John Doe", gifts: [
                Gift(name: "Smartwatch", price: 299.99),
                Gift(name: "Headphones", price: 199.99)
            ]),
            Recipient(name: "Jane Smith", gifts: [
                Gift(name: "Coffee Maker", price: 89.99),
                Gift(name: "Bluetooth Speaker", price: 59.99)
            ]),
            Recipient(name: "Emily Johnson", gifts: [
                Gift(name: "Fitness Tracker", price: 149.99),
                Gift(name: "Tablet", price: 499.99)
            ])
        ]
    
    
    
    // func to add recipient
    func addRecipient(name: String) {
        
        let newRecipient = Recipient(name: name, gifts: [])
        recipients.append(newRecipient)
    }
    
    // currently removing by name
    func removeRecipient(name: String) {
        
        recipients.removeAll { $0.name == name }
    }
    
    func addGift() {

    }
    
    func removeGift(gift: Gift) {
        
    }
}
