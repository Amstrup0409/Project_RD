//
//  RestrictionHandler.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 19/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit

class RestrictionHandler {
    static func identifyAndFetchInfo(of value: RestrictionValue) -> (UIImage, String) {
        let (restrictionID, _) = value.identify()
        switch restrictionID {
        case 1:
//            let lifestyle = Lifestyle(rawValue: restrictionName) // TODO: Fetch info from result
            
            return (UIImage(systemName: "cloud.fog.fill")!, "Clouds")
        case 2:
//            let allergy = Allergies(rawValue: restrictionName) // TODO: Fetch info from result
            
            return (UIImage(systemName: "flame")!, "Fire")
        default:
            fatalError("ID out of bounds")
        }
    }
}
