//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 郑小叶 on 2022/1/10.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    init(){
        themes = Themes()
        currentTheme = themes.pickTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }
    
    static func createMemoryGame(theme: Themes.Theme) -> MemoryGame<String>{
        let emojis = theme.emojis.shuffled()
        let numOfPairs = min(theme.numOfPairs, theme.emojis.count)
        return MemoryGame<String>(numberOfParisOfCards: numOfPairs) { pariIndex in emojis[pariIndex]
        }
    }
    
    private var themes: Themes
    private var currentTheme: Themes.Theme
    // "private(set)" others can look at model but cannot change
    @Published private var model: MemoryGame<String>
        
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    var score: String{
        return String(model.score)
    }
    
    var colorTheme: Color{
        switch currentTheme.color {
            case "green": return Color.green
            case "red": return Color.red
            case "blue": return Color.blue
            case "yellow": return Color.yellow
            case "grey": return Color.gray
            case "black": return Color.black
            default: return Color.red
        }
    }
    
    var theme: String{
        currentTheme.name
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    // MARK: - Intent(s)
    func creatNewGame(){
        currentTheme = themes.pickTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }
    
    //    func foo(){
    //        let x = EmojiMemoryGame.emojis
    //    }
}
