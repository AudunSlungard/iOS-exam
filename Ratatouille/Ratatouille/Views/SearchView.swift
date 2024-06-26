//
//  SearchView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import SwiftUI
import CoreData

struct SearchView: View {
    @AppStorage("isDark") var isDark = Settings.isDark
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    @StateObject private var mealDetailsListVM = MealDetailsListViewModel()

    @StateObject private var mealListVM = MealListViewModel()
    @State private var searchTerm: String = ""
    @State var baseURL: String = "https://www.themealdb.com/api/json/v1/1/search.php?s="
    @State var searchCatText = "navn"
    
    var body: some View {
        
        
        VStack{
            Text("Søker i: \(searchCatText)")
            NavigationView{
                List(mealListVM.meals, id: \.id){ meal in
                    NavigationLink(destination: MealDetailsView(id: meal.id), label: {
                        VStack{
                            HStack{
                                AsyncImage(url: URL(string: meal.imageUrl)) { phase in
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
                                Text(meal.name)
                            }
                        }
                    }
                    )
                    .swipeActions(edge: .leading, allowsFullSwipe: true){
                        Button{
                                DataController().addRecipe(id: meal.id, name: meal.name, instructions: "Ikke lagt til", area: "Ikke lagt til", category: "Ikke lagt til", imageUrl: meal.imageUrl, context: managedObjContext)
                            }
                            label: {
                            Image(systemName: "star").font(.title)
                        }
                        .tint(.yellow)
                    }
                }
                .searchable(text: $searchTerm).autocorrectionDisabled(true)
                .onChange(of: searchTerm){
                    Task {
                        if !searchTerm.isEmpty && searchTerm.count >= 2{
                            await mealListVM.search(text: searchTerm, baseUrl: baseURL)
                        }else{
                            mealListVM.meals.removeAll()
                        }
                    }
                }
                

            }
            ControlGroup{
                Button("Område") {
                    baseURL = "https://www.themealdb.com/api/json/v1/1/filter.php?a="
                    searchCatText = "område"
                }
                Button("Kategori") {
                    baseURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
                    searchCatText = "kategori"
                }
                Button("Navn") {
                    baseURL = "https://www.themealdb.com/api/json/v1/1/search.php?s="
                    searchCatText = "navn"
                }
            }
        }

    }
}

#Preview {
    SearchView()
}
