//
//  ContentView.swift
//  Memorize
//
//  Created by 郑小叶 on 2022/1/2.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack{
                vehiclesButton
                Spacer()
                foodButton
                Spacer()
                animalsButton
            }
            .padding(.horizontal)
            .font(.largeTitle)
            
        }
        .padding(.horizontal)
        
    }
    var vehiclesButton: some View{
        Button(action: {
//            emojis = vehicles.shuffled()
//            emojiCount = Int.random(in: 4...9)
        }, label: {
            VStack{
                Image(systemName: "car").font(.largeTitle)
                Text("Vehicles")
                    .font(.body)
            }
        })
    }
    
    var foodButton: some View{
        Button(action: {
//            emojis = food.shuffled()
//            emojiCount = Int.random(in: 4...9)
        }, label: {
            VStack{
                Image(systemName: "cart").font(.largeTitle)
                Text("Food")
                    .font(.body)
            }
        })
    }
    var animalsButton: some View{
        Button(action: {
//            emojis = animals.shuffled()
//            emojiCount = Int.random(in: 4...9)
        }, label: {
            VStack{
                Image(systemName: "hare").font(.largeTitle)
                Text("Animals")
                    .font(.body)
            }
        })
    }
}



struct CardView: View{
    let card: MemoryGame<String>.Card
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0) // 0-1
            }else{
                shape.fill()
            }
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .previewDevice("iPhone 8")
            
    }
}
