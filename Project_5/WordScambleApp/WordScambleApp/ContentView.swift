//
//  ContentView.swift
//  WordScambleApp
//
//  Created by Bhavesh Mishra on 23/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    var body: some View {
        NavigationStack {
            List{
                Section {
                    TextField("Enter you word", text: $newWord)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) {word in
                            Text(word)
                    }
                }
            }
            .navigationTitle(rootWord)
        }
        
    }
}

#Preview {
    ContentView()
}
