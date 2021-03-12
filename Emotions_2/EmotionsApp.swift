//
//  EmotionsApp.swift
//  Emotions
//
//  Created by 村上開斗 on 2021/03/03.
//

import SwiftUI

@main
struct EmotionsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(environmentObject())
        }
    }
}
