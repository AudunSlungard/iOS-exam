//
//  RatatouilleApp.swift
//  Ratatouille
//
//  Created by Kandidat 2068 on 02/12/2023.
//

import SwiftUI
import CoreData


@main
struct RatatouilleApp: App {
    @AppStorage("isDark") var isDark = Settings.isDark
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environment(\.colorScheme, isDark ? .dark : .light)

        }

    }
}
