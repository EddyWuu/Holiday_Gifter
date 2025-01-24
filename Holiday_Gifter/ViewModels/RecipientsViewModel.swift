//
//  recipientsViewModel.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-18.
//

import Foundation

class RecipientsViewModel: ObservableObject {
    
    @Published var overallBudget: Double = 0.0 {
        didSet {
            saveOverallBudget()
        }
    }
    
    @Published var recipients: [Recipient] = [] {
        didSet {
            saveRecipients()
        }
    }
    
    var totalSpending: Double {
        recipients.flatMap { $0.gifts }.reduce(0) { $0 + $1.price }
    }

    // load recipients on initialization
    init() {
        loadRecipients()
        loadOverallBudget()
    }
    
    private func saveOverallBudget() {
        UserDefaults.standard.set(overallBudget, forKey: "overallBudget")
    }
    
    private func loadOverallBudget() {
        if let savedBudget = UserDefaults.standard.value(forKey: "overallBudget") as? Double {
            overallBudget = savedBudget
        }
    }
    
    // save recipients to userdefaults
    private func saveRecipients() {
        do {
            let data = try JSONEncoder().encode(recipients)
            UserDefaults.standard.set(data, forKey: "recipients")
        } catch {
            print("Failed to save recipients: \(error)")
        }
    }
    
    // load recipients from user defaults
    private func loadRecipients() {
        guard let data = UserDefaults.standard.data(forKey: "recipients") else { return }
        do {
            recipients = try JSONDecoder().decode([Recipient].self, from: data)
        } catch {
            print("Failed to load recipients: \(error)")
        }
    }
    
    // func to add recipient
    func addRecipient(name: String) {
        
        let newRecipient = Recipient(name: name, gifts: [])
        recipients.append(newRecipient)
    }
    
    func removeRecipient(_ recipient: Recipient) {
        // remove by unique id
        recipients.removeAll { $0.id == recipient.id }
    }
    
    func addGift(_ gift: Gift, to recipient: Recipient) {
        // find first recipient whose id matches that id of the given recipient
        if let index = recipients.firstIndex(where: { $0.id == recipient.id }) {
            recipients[index].gifts.append(gift)
        }
    }
    
    func removeGift(_ gift: Gift, from recipient: Recipient) {
        // find first recipient whose id matches that id of the given recipient
        if let recipientIndex = recipients.firstIndex(where: { $0.id == recipient.id }) {
            recipients[recipientIndex].gifts.removeAll { $0.id == gift.id }
        }
    }
}
