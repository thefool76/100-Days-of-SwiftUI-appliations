//
//  ContentView.swift
//  RockPaperScissorApp
//
//  Created by Bhavesh Mishra on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    // added states to handle the choice of the player
    @State private var playerChoice = ""
    // added stated to handle computer choice
    @State private var computerChoice = ""
    // added state to handle the decide if he wins or not
    @State private var result = ""
    // added state to handle the score of the game
    @State private var score = 0
    
    var body: some View {
        VStack {
            Text("Welcome to the Game 💁")
                .font(.title.weight(.thin))
                Spacer()
            Text("Choose your Weapon now!")
                .font(.system(size: 20))
                .foregroundStyle(.secondary)    
            HStack {
                Button {
                   playgame("paper")
                }label: {
                    CustomImage(fileName: "icons8-hand-96")
                }
                
                Button {
                    playgame("rock")
                } label: {
                    CustomImage(fileName: "icons8-hand-rock-skin-type-2-96" )
                }
                Button {
                    playgame("scissor")
                } label: {
                    CustomImage(fileName: "icons8-victory-hand-96")
                }

            }
                Spacer()
            Text(result)
                .font(.headline)
                .padding()
                Spacer()
            
            Text("Score: \(score)")
                .font(.title)
        }
    }
    
    // Game Function logic
    func playgame(_ playerChoice: String) {
        let choices = ["rock", "paper", "scissor"]
        computerChoice = choices.randomElement()!
        
        self.playerChoice = playerChoice
        
        if playerChoice == computerChoice {
            result = "draw"
        } else if (playerChoice == "rock" && computerChoice == "scissor") || (playerChoice == "paper" && computerChoice == "rock") || (playerChoice == "scissor" && computerChoice == "paper") {
            result = "You win"
            score += 1
        } else {
            result = "computer wins"
            score -= 1
        }
        
        result += "\nYou chose \(playerChoice) and computer chose \(computerChoice)."
        
    }
}




struct CustomImage: View {
    let fileName: String
    var body: some View {
        Image(fileName)
            .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}

