//
//  ContentView.swift
//  TimerApp
//
//  Created by Bhavesh Mishra on 12/08/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timerVM: TimerViewModel
    @State var isPaused = false
    @State private var rotation = 0
    
    init(seconds: TimeInterval = 0) {
        timerVM = TimerViewModel(seconds: seconds, goalTime: 20)
    }
    var body: some View {
        NavigationStack {
        ZStack {
            // Background Color
            Color(
                red: 63/255, green: 68/255, blue: 3/255
            )
            .ignoresSafeArea()
            
            // Progress BarRing
            ProgressBarView(progress: $timerVM.seconds, goal: $timerVM.goalTime)
            
            VStack {
                Text(timerVM.progress >= 1 ? "Done" : timerVM.displayTime)
                    .font(.system(size: 56, weight: .bold))
                
                Text("\(timerVM.goalTime.asString(style: .short))")
            }
            .foregroundStyle(.white)
            
            VStack {
                Spacer()
                
                // bottom view
                ButtonView()
            }
        }
        .navigationTitle("Timer App")
        .toolbarColorScheme(.dark)
        .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}


extension ContentView {
    private func ButtonView() -> some View {
        HStack {
            //reset button
            Button {
                reset()
            } label: {
                HStack(spacing: 8, content: {
                    Label("Reset", systemImage: "arrow.clockwise")
                        .rotationEffect(.degrees(Double(rotation)))
                })
                .padding()
                .tint(.black)
                .frame(maxWidth: .infinity)
                .font(.system(size: 18, weight: .bold))
            }
            .background(Color(red: 236/255, green: 230/255, blue: 0/255))
            .cornerRadius(20)
            
            // start and pause button
            
            Button {
                if  (timerVM.progress < 1) {
                    isPaused.toggle()
                    isPaused ? timerVM.pauseSession() : timerVM.startSession()
                }
            } label: {
                HStack(spacing: 8, content: {
                    Label(isPaused ? "Start" : "Pause" ,
                          systemImage: isPaused ? "play.fill" : "pause.fill")
                        .rotationEffect(.degrees(Double(rotation)))
                })
                .padding()
                .tint(.black)
                .frame(maxWidth: .infinity)
                .font(.system(size: 18, weight: .bold))
            }
            .background(Color(red: 236/255, green: 230/255, blue: 0/255))
            .cornerRadius(20)
        }
        .padding(.bottom, 40)
        .padding([.leading ,.trailing], 20)
    }
    
    private func reset() {
        withAnimation(.easeInOut(duration: 0.3)) {
            rotation += 360
        }
        
        if timerVM.progress >= 1 {
            timerVM.startSession()
        }else{
            timerVM.reset()
            timerVM.displayTime = "00:00"
        }
    }
}
