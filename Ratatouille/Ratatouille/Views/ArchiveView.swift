//
//  ArchiveView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 03/12/2023.
//

import SwiftUI
import CoreData

struct ArchiveView: View {
    
    
    @Environment(\.managedObjectContext) var managedObjContext

    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var recipe: FetchedResults<RecipeDetails>
    
    var body: some View {
        
        VStack{
            NavigationView{
                VStack {
                    List(recipe){ recipe in
                        if recipe.isArchived == true {
                            VStack{
                                HStack{
                                    Text(recipe.name ?? "Finner ikke navn").bold()
                                }
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: true){
                                Button{ archiveRecipe(recipe: recipe, isArchived: false)}
                            label: {
                                Image(systemName: "trash.slash.fill").font(.title)
                            }
                            .tint(.green)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true){
                                Button{
                                    managedObjContext.delete(recipe)
                                    DataController().saveRecipe(context: managedObjContext)
                                    }
                                    label: {
                                    Image(systemName: "trash.fill").font(.title)
                                }
                                .tint(.red)
                            }
                        }
                    }
                    
                    
                }.navigationTitle("Arkiv")
            }
            
        }
    }

    private func archiveRecipe(recipe: RecipeDetails, isArchived: Bool){
        recipe.isArchived = isArchived
        
        DataController().saveRecipe(context: managedObjContext)
    }
}

#Preview {
    ArchiveView()
}
