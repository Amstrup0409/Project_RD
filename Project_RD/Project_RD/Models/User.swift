//
//  User.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit

class User {
    private var firstName: String
    private var lastName: String
    private var rating: Double { return Double(ratingAmount/ratingCount) }
    private var ratingCount: Int = 0
    private var ratingAmount: Int = 0
    private var image: UIImage?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func getImage() -> UIImage? {
        return self.image
    }
    
    func addRating(of amount: Int) {
        self.ratingCount += 1
        self.ratingAmount += amount
    }
}
