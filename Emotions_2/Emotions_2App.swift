//
//  Emotions_2App.swift
//  Emotions_2
//
//  Created by 村上開斗 on 2021/03/10.
//

import SwiftUI

@main
struct Emotions_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(environmentObject())
        }
    }
}
