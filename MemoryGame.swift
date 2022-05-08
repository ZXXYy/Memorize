//
//  MemoryGame.swift
//  Memorize
//
//  Created by 郑小叶 on 2022/1/10.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private var indexOfTheOneOnlyFaceUpCard: Int?
    private(set) var score: Int = 0
    
    init(numberOfParisOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        // add numberOfParisOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfParisOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
        
    }
    
    mutating func choose(_ card: Card){
        print(card)
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            
            if let potentialMatchIndex = indexOfTheOneOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                else{
                    if cards[chosenIndex].isVisited{
                        score -= 1
                    }
                    if cards[potentialMatchIndex].isVisited{
                        score -= 1
                    }
                }
                indexOfTheOneOnlyFaceUpCard = nil
            }else{
                for index in cards.indices{
                    if cards[index].isFaceUp {
                        cards[index].isVisited = true
                    }
                    cards[index].isFaceUp = false
                }
                indexOfTheOneOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }

    }
    
    
    // MemoryGame.Card
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isVisited: Bool = false
        var content: CardContent
        var id: Int
    }
}
