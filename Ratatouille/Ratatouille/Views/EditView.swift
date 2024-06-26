//
//  EditView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 03/12/2023.
//

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var recipe: FetchedResults<RecipeDetails>.Element
    
    @State private var name = ""
    @State private var category = ""
    @State private var area = ""
    @State private var instructions = ""
    
    var body: some View {
        
        
        
        VStack{
            AsyncImage(url: URL(string: recipe.imageUrl ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let img):
                    img
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(5)

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
            Form{
                Section{
                    Text("Oppskriftsnavn:").bold()
                    TextField("\(recipe.name!)", text: $name)
                        .onAppear{
                            name = recipe.name!
                        }
                    Text("Kategori:").bold()
                    TextField("\(recipe.category!)", text: $category)
                        .onAppear{
                            category = recipe.category!
                        }
                    Text("Område:").bold()
                    TextField("\(recipe.area!)", text: $area)
                        .onAppear{
                            area = recipe.area!
                        }
                    Text("Instruksjoner:").bold()
                    TextField("\(recipe.instructions!)", text: $instructions)
                        .onAppear{
                            instructions = recipe.instructions!
                        }
                }
                
                Button("Lagre endringer") {
                    DataController().editRecipe(recipe: recipe, name: name, instructions: instructions, area: area, category: category, context: managedObjContext)
                    dismiss()
                }
        }
        }
    }
}

//#Preview {
//    EditView()
//}
