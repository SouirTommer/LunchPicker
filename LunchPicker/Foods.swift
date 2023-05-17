//
//  Foods.swift
//  LunchPicker
//
//  Created by ST SE on 17/5/2023.
//

import Foundation
struct Foods : Equatable{
    var name: String
    var calorie: Double
    var carb: Double
    var fat: Double
    var protein: Double
    
    static let examples = [
        Foods(name: "Food1", calorie: 294, carb: 14, fat: 24, protein: 17),
        Foods(name: "Food2", calorie: 89, carb: 20, fat: 0, protein: 1.8),
        Foods(name: "Food3", calorie: 266, carb: 33, fat: 10, protein: 11)
    
    ]
}
