//
//  Webservice.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import Foundation

enum NetworkError: Error{
    case badURL
    case badID
}

class Webservice{
    func getMeals(searchTerm: String, baseUrl: String) async throws -> [Meal]{
    
        guard let url = URL(string: baseUrl + searchTerm) else{
            throw NetworkError.badURL
            }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let mealResponse = try? JSONDecoder().decode(MealResponse.self, from: data)
        return mealResponse?.meals ?? []
    }
    
    func getMealDetails(searchTerm: String, baseUrl: String) async throws -> [MealDetails]{
    
        guard let url = URL(string: baseUrl + searchTerm) else{
            throw NetworkError.badURL
            }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let mealDetailsResponse = try? JSONDecoder().decode(MealDetailsResponse.self, from: data)
        return mealDetailsResponse?.mealDetails ?? []
    }
}
