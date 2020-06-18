//
//  User.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit

class User {
    let firstName: String
    let lastName: String
    var ratingCount: Int = 0
    var ratingAmount: Int = 0
    var image: UIImage?
//    private var image: UIImage? = UIImage(named: "earthIcon") // For testing purposes
    
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
    
    func getRating() -> Double {
        Double(ratingAmount/ratingCount)
    }
}

class UserViewModel {
    let user: User
    
    init(_ user: User) {
        self.user = user
    }
    
    func getFullName() -> String {
        user.firstName + " " + user.lastName
    }
    
    func getRating() -> Double {
        self.user.getRating()
    }
    
    func addRatingToUser(of amount: Int) {
        self.user.addRating(of: amount)
    }
}
