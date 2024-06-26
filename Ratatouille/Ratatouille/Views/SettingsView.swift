//
//  SettingsView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import SwiftUI
import CoreData

enum Settings{
    static let isDark = false
}

struct SettingsView: View {
    @AppStorage("isDark") var isDark = Settings.isDark
    
    var body: some View {
        
        VStack {
            
            NavigationView{

                VStack {
                    HStack{
                        Spacer()
                        Toggle("Skru på mørk modus", isOn: $isDark)
                    }
                    .padding()
                    

                    HStack{
                        NavigationLink(destination: ArchiveView()){
                            Text("Rediger arkiv")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.title)
                        }
                        .navigationTitle("Innstillinger")
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
