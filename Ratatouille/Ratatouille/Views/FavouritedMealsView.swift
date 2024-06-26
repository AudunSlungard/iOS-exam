//
//  FavouritedMealsView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import SwiftUI
import CoreData

struct FavouritedMealsView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var recipe: FetchedResults<RecipeDetails>
    
    @State private var showAddView = false
    let dateFormatter = DateFormatter()
    
    
    var body: some View {
        VStack{
            if recipe.isEmpty{
                EmptyFavListView()
            }
            else {
                NavigationView{
                    VStack {
                        List(recipe){ recipe in
                            if recipe.isArchived == false {
                                VStack{
                                    NavigationLink(destination: EditView(recipe: recipe)){
                                        AsyncImage(url: URL(string: recipe.imageUrl ?? "")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let img):
                                                img
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(60)

                                            case .failure:
                                                Image(systemName: "carrot")
                                                    .font(.title).padding(100)
                                                    .background(Color.black)
                                                    .foregroundColor(Color.white)
                                                    .scaledToFit()
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(60)
                                            default:
                                                Image(systemName: "carrot")
                                                    .font(.title).padding(100)
                                                    .background(Color.black)
                                                    .foregroundColor(Color.white)
                                                    .scaledToFit()
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(60)
                                            }
                                        }
                                        HStack{
                                            Text(recipe.name ?? "Finner ikke navn").bold()
//                                            Text(recipe.area ?? "Finner ikke område")
//                                            Text(String(recipe.isArchived))
                                        }
                                    }

                                   
                                }.swipeActions(edge: .trailing, allowsFullSwipe: true){
                                    Button{ archiveRecipe(recipe: recipe, isArchived: true)}
                                label: {
                                    Image(systemName: "archivebox.fill").font(.title)
                                }
                                .tint(.blue)
                                }
                            }

                        }
                    }
                    .navigationTitle("Mine favoritter")
                }
            }
        }
    }

    private func archiveRecipe(recipe: RecipeDetails, isArchived: Bool){
        recipe.isArchived = isArchived
        
        DataController().saveRecipe(context: managedObjContext)
    }
}

#Preview {
    FavouritedMealsView()
}
