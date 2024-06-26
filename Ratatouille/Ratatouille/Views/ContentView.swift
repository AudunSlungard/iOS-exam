//
//  ContentView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSplashing = true
    
    
    var body: some View {
        
        @AppStorage("isDark") var isDark = Settings.isDark
        
        
        
        
        ZStack{
            if isSplashing{
                SplashView()
            }
            
            else {
                VStack{
                    TabView {
                        
                        FavouritedMealsView()
                            .tabItem {
                                Label("Favoritter", systemImage: "fork.knife.circle")
                            }
                        SearchView()
                            .tabItem {
                                Label("Søk", systemImage: "magnifyingglass")
                            }
                        
                        SettingsView()
                            .tabItem {
                                Label("Innstillinger", systemImage: "gearshape.fill")
                            }
                    }
                }
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.99){
                withAnimation{self.isSplashing = false}
            }
        }

    }
}

#Preview {
    ContentView()
}
