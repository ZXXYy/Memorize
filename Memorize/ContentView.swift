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
            HStack{
                newGameButton.padding()
                Spacer()
                Text(viewModel.theme)
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                Spacer()
                Text("⭐️"+viewModel.score)
                    .font(.largeTitle).padding()
            }
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
            .foregroundColor(viewModel.colorTheme)
            Spacer()
            
            
        }
        .padding(.horizontal)
        
    }
    
    var newGameButton: some View{
        Button(action: {
            viewModel.creatNewGame()
        }, label: {
            VStack{
                Image(systemName: "arrow.clockwise.circle").font(.title)
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
