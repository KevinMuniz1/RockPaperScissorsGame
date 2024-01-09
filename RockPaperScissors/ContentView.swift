//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kevin Muniz on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var handOptions = ["🖐️", "✊", "✌️"]
    @State private var handChoice = Int.random(in: 0...2)
    private var appChoice: String {
        handOptions[handChoice]
    }
    @State private var userAnswer = "🖐️"
    @State private var winOrLoseAlert = false
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var messageTitle = ""
    var body: some View {
        NavigationStack {
            VStack{
                Text("Your oponents hand is chosen at random")
                    .font(.headline)
                Text(appChoice)
                    .font(.system(size: 150))
                    .padding(.bottom, 50)
                Text("What option do you think will win?")
                    .font(.headline)
                HStack(){
                    ForEach(handOptions, id: \.self){ number in
                        Button(number) {
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
        }.alert(alertTitle, isPresented: $winOrLoseAlert){
            Button("Try Again!"){
                
            }
        } message: {
            Text(messageTitle)
        }
    }
    func checkAnswer(){
        if userAnswer == appChoice {
            alertTitle = "This is a tie"
            messageTitle = "You have not won or lost any points"
            winOrLoseAlert = true
        } else {
            if userAnswer == "🖐️" && appChoice == "✊"{
                alertTitle = "You have won!"
                messageTitle = "You have scored a point!"
                score += 1
                winOrLoseAlert = true
            } else if userAnswer == "🖐️" && appChoice == "✌️"{
                alertTitle = "You have lost"
                messageTitle = "You have lost a point!"
                if score > 0 {
                    score -= 1
                }
                winOrLoseAlert = true
            } else if userAnswer == "✊" && appChoice == "🖐️"{
                alertTitle = "You have lost"
                messageTitle = "You have lost a point!"
                if score > 0 {
                    score -= 1
                }
                winOrLoseAlert = true
            } else if userAnswer == "✊" && appChoice == "✌️" {
                alertTitle = "You have won!"
                messageTitle = "You have scored a point!"
                winOrLoseAlert = true
                score += 1
            } else if userAnswer == "✌️" && appChoice == "✊" {
                alertTitle = "You have lost"
                messageTitle = "You have lost a point!"
                if score > 0 {
                    score -= 1
                }
                winOrLoseAlert = true
            } else if userAnswer == "✌️" && appChoice == "🖐️"{
                alertTitle = "You have won!"
                messageTitle = "You have scored a point!"
                score += 1
                winOrLoseAlert = true
            }
        }
    }
    func restartGame() {
        
    }
    
}

#Preview {
    ContentView()
}
