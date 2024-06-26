//
//  EmptyFavListView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import SwiftUI

struct EmptyFavListView: View {
    
    var body: some View {
        VStack{
            Image(.ratatouille)
                .resizable()
                .frame(maxWidth: 380, maxHeight: 380)
                .padding()
            VStack{
                Image(systemName: "square.stack.3d.up.slash").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).foregroundColor(.gray)
                
            }
            Text("Ingen oppskrifter..")
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.myPrimary)
    }
}

#Preview {
    EmptyFavListView()
}
