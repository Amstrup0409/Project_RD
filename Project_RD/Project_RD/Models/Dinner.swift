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
    var attendees: [User?] = [User?]()
    var hostedBy: [User?]
    var guestCapacity: Int
    
    init(title: String, description: String? = nil, host: User..., guestCapacity: Int) {
        self.title = title
        self.description = description
        self.hostedBy = host
        self.guestCapacity = guestCapacity
    }
    
    func addAttendee(_ attendee: User) -> Bool {
        guard attendees.count < guestCapacity else { return false }
        self.attendees.append(attendee) // TODO: Check for unique entries
        return true
    }
    
}
