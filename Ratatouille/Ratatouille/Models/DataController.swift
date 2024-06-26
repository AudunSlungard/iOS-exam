//
//  DataController.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "RecipeModel")
    
    init() {
        container.loadPersistentStores{description, error in
            if let error = error {
                print("Kunne ikke laste data: \(error.localizedDescription)")
            }
        }
    }
    
    func saveRecipe(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data lagret..")
        } catch {
            print("Kunne ikke lagre dataene: \(error)")
        }
    }
    
    func addRecipe(id: String, name: String, instructions: String, area: String, category: String, imageUrl: String, context: NSManagedObjectContext){
        let recipe = RecipeDetails(context: context)
        recipe.id = id
        recipe.name = name
        recipe.instructions = instructions
        recipe.area = area
        recipe.category = category
        recipe.imageUrl = imageUrl
        recipe.date = Date()
        recipe.isArchived = false
        
        saveRecipe(context: context)
    }
    
    func editRecipe(recipe: RecipeDetails, name: String, instructions: String, area: String, category: String, context: NSManagedObjectContext){
        recipe.name = name
        recipe.instructions = instructions
        recipe.area = area
        recipe.category = category
        recipe.date = Date()
        
        saveRecipe(context: context)
    }
    
//    func archiveRecipe(recipe: RecipeDetails, isArchived: Bool, context: NSManagedObjectContext){
//        recipe.isArchived = isArchived
//        
//        saveRecipe(context: context)
//    }
    
    
}
