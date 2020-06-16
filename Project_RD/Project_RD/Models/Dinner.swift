//
//  Dinner.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import Foundation

class Dinner {
    var title: String
    var description: String?
    var guests: [User?] = [User?]()
    var hostedBy: [User?]
    var guestCapacity: Int
    
    init(title: String, description: String? = nil, guestCapacity: Int, host: User...) {
        self.title = title
        self.description = description
        self.hostedBy = host
        self.guestCapacity = guestCapacity
    }
    
    func addGuest(_ guest: User) -> Bool {
        guard guests.count < guestCapacity else { return false }
        self.guests.append(guest) // TODO: Check for unique entries
        return true
    }
    
    func getRemainingCapacity() -> Int { guestCapacity - guests.count }
    
}
