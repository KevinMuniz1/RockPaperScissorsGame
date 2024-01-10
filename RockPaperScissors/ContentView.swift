//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kevin Muniz on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    private var handOptions = ["✊", "🖐️", "✌️"]
    @State private var randomMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var winOrLoseAlert = false
    @State private var gameover = false
    @State private var score = 0
    @State private var totalRounds = 0
    var body: some View {
        NavigationStack {
            VStack{
                Text("The computer has chosen")
                    .font(.headline)
                Text(handOptions[randomMove])
                    .font(.system(size: 150))
                    .padding(.bottom, 50)
                if shouldWin {
                    Text("Which option will win?")
                        .foregroundStyle(.green)
                        .font(.headline)
                } else {
                    Text("Which option will lose?")
                        .foregroundStyle(.red)
                        .font(.headline)
                }
                HStack(){
                    ForEach(0..<3){ number in
                        Button(handOptions[number]) {
                            checkAnswer(choice: number)
                        }
                        .font(.system(size: 75))
                        .padding()
                    }
                }
                Text("Score: \(score)")
                    .font(.title2).bold()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.regularMaterial)
            .background(.blue)
            .navigationTitle("Rock Paper Scissors")
        }.alert("Game Over", isPresented: $gameover){
            Button("Start Over"){
                resetGame()
            }
        } message: {
            Text("Your final score is \(score)")
        }
    }
    func checkAnswer(choice: Int){
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningMoves[randomMove]
        } else {
            didWin = winningMoves[choice] == randomMove
        }
        
        if didWin {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
        if totalRounds == 10 {
            gameover = true
        } else {
            randomMove = Int.random(in: 0...2)
            shouldWin.toggle()
            totalRounds += 1
        }
    }
    
    func resetGame() {
        randomMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        score = 0
        totalRounds = 0
    }
}

#Preview {
    ContentView()
}
