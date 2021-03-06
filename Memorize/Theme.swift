//
//  Theme.swift
//  Memorize
//
//  Created by éå°åķ on 2022/5/8.
//

import Foundation

struct Themes{
    var themes: Array<Theme>
    init(){
        themes = Array<Theme>()
        themes.append(Theme(name: "Vehicles", emojis: ["ð","ðĩ","ðš","ð","ðĒ","ð ","ð","ðē","ðī"], numOfPairs: 5, color: "red", id: 1))
        themes.append(Theme(name: "Animals", emojis:       ["ðĶ","ðĪ","ð","ð·","ð","ðĶ","ðĶ","ðĒ","ð"], numOfPairs: 6, color: "blue", id: 2))
        themes.append(Theme(name: "Food", emojis: ["ð","ð","ð","ð","ðĨ","ðą","ðŠ","ð­","ð"], numOfPairs: 5, color: "green", id: 3))
        themes.append(Theme(name: "Fruit", emojis:
            ["ð", "ðŦ", "ð"],
            numOfPairs: 5, color: "yellow", id: 4))
        themes.append(Theme(name: "Organ", emojis:
            ["ð", "ðĶĩ", "ð", "ð", "ð", "ðĶ·"],
            numOfPairs: 5, color: "grey", id: 5))
        themes.append(Theme(name: "Sports", emojis: ["ð","ðĨ","ðââïļ","â·","ð","ðĢââïļ","ðĪš","ð","ðïļââïļ"], numOfPairs: 5, color: "black", id: 6))
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


