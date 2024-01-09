//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kevin Muniz on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    private var userQuestion = ["Which option will win?", "Which option will lose?"]
    private var handOptions = ["🖐️", "✊", "✌️"]
    @State private var computerHandOptions = ["🖐️", "✊", "✌️"]
    @State private var randomQuestion = Int.random(in: 0...1)
    @State private var userAnswer = ""
    @State private var winOrLoseAlert = false
    @State private var gameover = false
    @State private var score = 0
    @State private var totalRounds = 0
    @State private var alertTitle = ""
    @State private var messageTitle = ""
    var body: some View {
        NavigationStack {
            VStack{
                Text("The computer has chosen")
                    .font(.headline)
                Text(computerHandOptions[0])
                    .font(.system(size: 150))
                    .padding(.bottom, 50)
                Text(userQuestion[Int.random(in: 0...1)])
                    .font(.headline)
                HStack(){
                    ForEach(handOptions, id: \.self){ number in
                        Button(number) {
                            computerHandOptions.shuffle()
                            userAnswer = number
                            checkAnswer()
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
                restartGame()
            }
        } message: {
            Text("Your final score is \(score)")
        }
        .alert(alertTitle, isPresented: $winOrLoseAlert){
            Button("Try Again!"){
                nextQuestion()
            }
        } message: {
            Text(messageTitle)
        }
    }
    func checkAnswer(){
        
    }
    
    func nextQuestion() {
        
    }
    func restartGame() {
        score = 0
        totalRounds = 0
    }
    
}

#Preview {
    ContentView()
}
