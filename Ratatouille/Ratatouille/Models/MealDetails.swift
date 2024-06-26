//
//  MealDetails.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import Foundation

struct MealDetailsResponse: Decodable{
    let mealDetails: [MealDetails]
    
    private enum CodingKeys: String, CodingKey{
        case mealDetails = "meals"
    }
}

struct MealDetails: Decodable{
    let id: String
    let name: String
    let imageUrl: String
    let category: String
    let area: String
    let instructions: String
    
    
    private enum CodingKeys: String, CodingKey{
        case id = "idMeal"
        case name = "strMeal"
        case imageUrl = "strMealThumb"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
    }
}
