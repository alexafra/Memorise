//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Alexander Frazis on 5/8/2024.
//

import SwiftUI

@main
struct MemoriseApp: App {
    var game = EmojiMemoryGameViewModel()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView()
                .environment(game)
        }
    }
}
