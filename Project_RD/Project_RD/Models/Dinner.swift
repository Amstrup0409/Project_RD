//
//  Dinner.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import Foundation

class DinnerEnums {
    enum Theme: String {
        case American
        case Italian
        case Chinese
        case Sushi
        case Indian
        case BBQ
        case Pizza
        case Grill
    }
}

class Dinner {
    let title: String
    var description: String?
    var guests: [User?] = [User?]()
    var hostedBy: [User?]
    var guestCapacity: Int
    
    var theme: DinnerEnums.Theme?
    
    init(title: String, description: String? = nil, guestCapacity: Int, host: User...) {
        self.title = title
        self.description = description
        self.hostedBy = host
        self.guestCapacity = guestCapacity
        if guestCapacity < 2 {
            self.theme = .Pizza
        }
    }
    
    func addGuest(_ guest: User) -> Bool {
        guard guests.count < guestCapacity else { return false }
        self.guests.append(guest) // TODO: Check for unique entries
        return true
    }
    
    func getRemainingCapacity() -> Int { guestCapacity - guests.count }
}
