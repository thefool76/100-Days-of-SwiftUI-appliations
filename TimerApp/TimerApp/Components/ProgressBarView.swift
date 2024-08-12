//
//  ProgressBarView.swift
//  TimerApp
//
//  Created by Bhavesh Mishra on 12/08/24.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var progress: TimeInterval
    @Binding var goal: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .butt,
                        dash: [2,6]
                    )
                )
                .fill(.gray)
                .rotationEffect(Angle(degrees: -90))
                .frame(
                width: 300,
                height: 300
                )
            
            // overlap Circle
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .butt,dash: [2,6]))
                .fill(Color(red: 236/255, green: 230/255, blue: 0/255))
                .animation(.spring(), value: progress)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 300, height: 300)
        }
    }
}

#Preview {
    ProgressBarView(
        progress: .constant(0), goal: .constant(0)
    )
}
