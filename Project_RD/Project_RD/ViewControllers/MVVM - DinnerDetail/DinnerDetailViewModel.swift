//
//  DinnerDetailViewModel.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 19/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit

class DinnerDetailViewModel {
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
    
    func getLocalizedDistanceString() -> String {
        return "PH: 1km away" // TODO: Switch to non-static value
    }
    
    func getTheme() -> DinnerEnums.Theme? {
        return dinner.theme
    }
    
    func getRestrictions() -> DietaryRestrictions? {
        return DietaryRestrictions(allergies: [Allergies.Diary, Allergies.Air], lifestyles: Lifestyle.Vegan, Lifestyle.PickyAndStubborn) // TODO: Switch to non-static value
    }
}
