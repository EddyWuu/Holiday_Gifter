//
//  GiftModels.swift
//  Holiday_Gifter
//
//  Created by Edmond Wu on 2024-09-17.
//

import Foundation

struct Gift: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var price: Double
    var url: String?
    var imageUrl: String?
}

struct Recipient: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var gifts: [Gift]
}
