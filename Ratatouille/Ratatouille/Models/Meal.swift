//
//  Meal.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import Foundation

struct MealResponse: Decodable{
    let meals: [Meal]
}

struct Meal: Decodable{
    let id: String
    let name: String
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey{
        case id = "idMeal"
        case name = "strMeal"
        case imageUrl = "strMealThumb"
    }
}
