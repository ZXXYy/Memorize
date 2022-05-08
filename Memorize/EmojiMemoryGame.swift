//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 郑小叶 on 2022/1/10.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    //    var emojis: [String] = ["🚗","🛵","🛺","🚅"]
    //    var emojis = ["🚗","🛵","🛺","🚅"]
//        let vehicles =  ["🚗","🛵","🛺","🚅","🚢","🚠","🚔","🚲","🛴"]
//        let animals = ["🦊","🐤","🐟","🐷","🐝","🦀","🦋","🐢","🐌"]
//        let food = ["🍟","🍞","🍗","🍕","🥗","🍱","🍪","🍭","🍙"]
    static let emojis =  ["🚗","🛵","🛺","🚅","🚢","🚠","🚔","🚲","🛴"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfParisOfCards: 5) { pariIndex in
            emojis[pariIndex]
        }
    }
    
    // "private(set)" others can look at model but cannot change
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    //    func foo(){
    //        let x = EmojiMemoryGame.emojis
    //    }
}
