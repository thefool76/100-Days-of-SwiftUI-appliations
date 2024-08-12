//
//  ContentView.swift
//  TimerApp
//
//  Created by Bhavesh Mishra on 12/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background Color
            Color(
                red: 63/255, green: 68/255, blue: 3/255
            )
            .ignoresSafeArea()
            
            // Progress BarRing
            ProgressBarView(progress: <#T##Binding<TimeInterval>#>, goal: <#T##Binding<Double>#>)
            
        }
    }
}

#Preview {
    ContentView()
}
