//
//  ContentView.swift
//  Memorize
//
//  Created by Ke Quan on 11/7/21.
//

import SwiftUI

class EmojiContent {
    var id: Int
    var emoji: String
    
    init (id: Int, emoji:String) {
        self.id = id
        self.emoji = emoji
    }
}

struct ContentView: View {
    @State var emojis = [
        "🐶": ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐯"],
        "🚗": ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🛻"]
    ]
    @State var emojiTheme = "🐶"
    @State var emojiCount = 7
    
    var columns = [GridItem(.adaptive(minimum: 85))]
    
    var body: some View {
        VStack {
            titile
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(emojis[emojiTheme]?[0..<emojiCount] ?? [], id: \.self, content:{ emojiContent in
                        CardView(content: emojiContent)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                    
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                addButton
                Spacer().frame(width: 50)
                carThemeButton
                Spacer().frame(width: 25)
                animalThemeButton
                Spacer().frame(width: 50)
                removeButton
            }
            .font(.largeTitle)
            
        }
        .padding(.horizontal)
    }
    
    var titile: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var addButton: some View  {
        Button(action: {
            if emojiCount < emojis[emojiTheme]?.count ?? 0 {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var removeButton: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }

    var carThemeButton: some View {
        let buttonTheme = "🚗"
        return Button(action: {
            emojiTheme = buttonTheme
            var shuffledEmojis = emojis[buttonTheme] ?? []
            shuffledEmojis.shuffle()
            emojis[emojiTheme] = shuffledEmojis
        }, label: {
            VStack {
                Text("Cars").font(.footnote)
                Text(buttonTheme)
            }
        })
    }
    
    var animalThemeButton: some View {
        let buttonTheme = "🐶"
        return Button(action: {
            emojiTheme = buttonTheme
            var shuffledEmojis = emojis[buttonTheme] ?? []
            shuffledEmojis.shuffle()
            emojis[emojiTheme] = shuffledEmojis
        }, label: {
            VStack {
                Text("Animals").font(.footnote)
                Text(buttonTheme)
            }
        })
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack  {
            let cell = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if isFaceUp {
                cell.fill().foregroundColor(.white)
                cell.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                cell.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
