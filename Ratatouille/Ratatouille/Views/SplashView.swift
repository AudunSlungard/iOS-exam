//
//  SplashView.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import SwiftUI

struct SplashView: View {

    @State private var scale = 0.01
    
    var body: some View {

        VStack{
            VStack{
                Image(.ratatouille)
                    .resizable()
                    .frame(maxWidth: 380, maxHeight: 380)
                    .padding()
            }.onAppear{
                scale += 0.99
            }
                .scaleEffect(scale)
                .animation(.linear(duration: 0.4), value: scale)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        
    }
}

#Preview {
    SplashView()
}
