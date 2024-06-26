//
//  MealDetailsView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import SwiftUI

struct MealDetailsView: View {
    var id: String
    @StateObject private var mealDetailsListVM = MealDetailsListViewModel()
    
    var body: some View {
        VStack{
            List(mealDetailsListVM.mealDetails, id: \.id){ meal in
                    VStack{
                        Text(meal.name).font(.title)
                        AsyncImage(url: URL(string: meal.imageUrl)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let img):
                                img
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .cornerRadius(6)
                                
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
                        
                        Text(meal.area)
                        Text("Instructions").font(.title2)
                        ScrollView{
                            Text(meal.instructions)
                        }
                    }
                }
        }.task {
            await mealDetailsListVM.search(id: id, baseUrl: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=")
        }
    }
}

#Preview {
    MealDetailsView(id: "53027")
}
