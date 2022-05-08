//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 郑小叶 on 2022/1/2.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
