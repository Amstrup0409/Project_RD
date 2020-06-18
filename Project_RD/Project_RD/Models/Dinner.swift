//
//  Dinner.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import Foundation



class Dinner {
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
    
    let title: String
    var description: String?
    var guests: [User?] = [User?]()
    var hostedBy: [User?]
    var guestCapacity: Int
    
    var theme: Theme?
    
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

class DinnerViewModel {
    private let dinner: Dinner
    
    init(_ dinner: Dinner) {
        self.dinner = dinner
    }
    
    func getTitle() -> String {
        return dinner.title
    }
    
    func getDescription() -> String? {
        return dinner.description
    }
    
    func getLocalizedDateString() -> String {
        return "PH: 01/01 - 2020" // TODO: Switch to non-static value
    }
    
    func getLocalizedBudgetString() -> String {
        return "PH: 100 - 250" // TODO: Switch to non-static value
    }
    
    func getTheme() -> Dinner.Theme? {
        return dinner.theme
    }
}
