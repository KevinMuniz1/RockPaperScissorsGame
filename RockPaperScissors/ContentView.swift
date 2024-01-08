//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kevin Muniz on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var handOptions = ["🖐️", "✊", "✌️"]
    @State private var handChoice = Int.random(in: 1...3)
    @State private var winOrLoseAlert = false
    @State private var score = 0
    @State private var alertTitle = ""
    var body: some View {
        NavigationStack {
            VStack{
                Text("Your oponents hand is chosen at random")
                    .font(.headline)
                Text(handOptions.randomElement() ?? "None")
                    .font(.system(size: 150))
                    .padding(.bottom, 50)
                Text("What option do you think will win?")
                    .font(.headline)
                HStack(){
                    ForEach(handOptions, id: \.self){ number in
                        Button(number) {
                            
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
            Button("Try Again!"){}
        }
    }
}

#Preview {
    ContentView()
}
