//
//  MealDetailsViewModel.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import Foundation

@MainActor
class MealDetailsListViewModel: ObservableObject{
    
    @Published var mealDetails: [MealDetailsViewModel] = []
    
    func search(id: String, baseUrl: String) async {
        do{
            let mealDetails = try await Webservice().getMealDetails(searchTerm: id, baseUrl: baseUrl)
            self.mealDetails = mealDetails.map(MealDetailsViewModel.init)
        }
        catch{
            print(error)
        }
    }
}

struct MealDetailsViewModel{
    let mealDetails: MealDetails
    
    var id: String{
        mealDetails.id
    }
    var name: String{
        mealDetails.name
    }
    var imageUrl: String{
        mealDetails.imageUrl
    }
    
    var area: String{
        mealDetails.area
    }
    
    var instructions: String{
        mealDetails.instructions
    }
    
}
