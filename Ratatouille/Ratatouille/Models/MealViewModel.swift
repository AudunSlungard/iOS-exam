//
//  MealViewModel.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import Foundation

@MainActor
class MealListViewModel: ObservableObject{
    
    @Published var meals: [MealViewModel] = []
    
    func search(text: String, baseUrl: String) async {
        do{
            let meals = try await Webservice().getMeals(searchTerm: text, baseUrl: baseUrl)
            self.meals = meals.map(MealViewModel.init)
        }
        catch{
            print(error)
        }
    }
}

struct MealViewModel{
    let meal: Meal
    
    var id: String{
        meal.id
    }
    var name: String{
        meal.name
    }
    var imageUrl: String{
        meal.imageUrl
    }
    
}
