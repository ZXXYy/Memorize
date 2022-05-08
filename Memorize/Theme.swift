//
//  Theme.swift
//  Memorize
//
//  Created by 郑小叶 on 2022/5/8.
//

import Foundation

struct Themes{
    var themes: Array<Theme>
    init(){
        themes = Array<Theme>()
        themes.append(Theme(name: "Vehicles", emojis: ["🚗","🛵","🛺","🚅","🚢","🚠","🚔","🚲","🛴"], numOfPairs: 5, color: "red", id: 1))
        themes.append(Theme(name: "Animals", emojis:       ["🦊","🐤","🐟","🐷","🐝","🦀","🦋","🐢","🐌"], numOfPairs: 6, color: "blue", id: 2))
        themes.append(Theme(name: "Food", emojis: ["🍟","🍞","🍗","🍕","🥗","🍱","🍪","🍭","🍙"], numOfPairs: 5, color: "green", id: 3))
        themes.append(Theme(name: "Fruit", emojis:
            ["🍎", "🫐", "🍋"],
            numOfPairs: 5, color: "yellow", id: 4))
        themes.append(Theme(name: "Organ", emojis:
            ["👁", "🦵", "👃", "👂", "👄", "🦷"],
            numOfPairs: 5, color: "grey", id: 5))
        themes.append(Theme(name: "Sports", emojis: ["🏐","🥌","🏊‍♀️","⛷","🏓","🚣‍♂️","🤺","🏇","🏋️‍♀️"], numOfPairs: 5, color: "black", id: 6))
    }
    
    func pickTheme()->Theme{
        return themes[Int.random(in: 0...5)]
    }
    
    struct Theme: Identifiable{
        var name: String
        var emojis: Array<String>
        var numOfPairs: Int
        var color: String
        var id: Int
    }
}


