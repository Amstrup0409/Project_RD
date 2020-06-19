//
//  DietaryRestrictions.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 19/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import Foundation

// TODO: Finish IntegerLiteral based solution?
//enum DietaryRestrictions: Int, ExpressibleByIntegerLiteral {
//    typealias IntegerLiteralType = Int
//
//    case Vegan = 1
//    case Vegetarian = 2
//    case Picky = 3
//}

protocol RestrictionValue {
    func identify() -> (Int, String)
}

// MARK: Static values for now. Look into if restrictions should be contained on backend/cloud? (High risk of expanding lists)
struct DietaryRestrictions {
    var lifestyles: [Lifestyle]?
    var allergies: [Allergies?]
    
    init(allergies: [Allergies?], lifestyles: Lifestyle...) {
        self.allergies = allergies
        self.lifestyles = lifestyles
    }
}
    
enum Lifestyle: String, RestrictionValue {
    case Vegan
    case Vegetarian
    case PickyAndStubborn
    
    func identify() -> (Int, String) {
        return (1, self.rawValue)
    }
}

enum Allergies: String, RestrictionValue {
    case Diary
    case Fish
    case Gluten
    case Air
    
    func identify() -> (Int, String) {
          return (2, self.rawValue)
      }
}

struct TypeWrapper: Identifiable {
    var id = UUID()
    var value: RestrictionValue
}

//extension RestrictionValue: Identifiable {
//    var id: String { getID() }
//}






