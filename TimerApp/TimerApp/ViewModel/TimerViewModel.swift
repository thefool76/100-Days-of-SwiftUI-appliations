//
//  TimerViewModel.swift
//  TimerApp
//
//  Created by Bhavesh Mishra on 12/08/24.
//

import SwiftUI
import AudioToolbox
import AVFoundation

class TimerViewModel: NSObject, ObservableObject {
    
    @Published var progress: Double
    @Published var seconds: TimeInterval
    @Published var displayTime: String = ""
    @Published var goalTime: Double = 0
    
    private var timer: Timer = Timer()
    
    // System sound object
    private var SoundID: SystemSoundID = 1407
    
    init(seconds: TimeInterval,goalTime: Double) {
        self.progress = seconds / Double(goalTime)
        self.seconds = seconds
        self.goalTime = goalTime
    }
    
    @objc func fireTimer() {
        seconds += 0.2
        progress =  Double(seconds) / Double(goalTime)
        self.displayTime = calculateDisplayTime()
        print(progress)
        
        // if timer is completed we stop the session and play the sound.
        if progress >= 1 {
            stopSession()
            makeSoundAndVibration()
        }
    }
    
    // start Session
    func startSession() {
        print("Timer Started")
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.fireTimer), userInfo: nil, repeats: true)
    }
    
    func stopSession() {
        print("Timer Stopped")
        timer.invalidate()
    }
    
    // Pause Session
    
    func pauseSession() {
        timer.invalidate()
    }
    
    func reset() {
        seconds = 0
        progress = 0
    }
}

// public methods
extension TimerViewModel {
    func viewDidLoad() {
        self.progress = seconds / Double(goalTime)
        self.displayTime =  calculateDisplayTime()
    }
}

extension TimerViewModel {
    private func calculateDisplayTime() -> String {
        var time = ""
        
        let min = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        
        if min > 9 {
            time.append(min.description)
        }else{
            time.append("0" + min.description)
        }
        time.append(":")
        
        if seconds > 9 {
            time.append(seconds.description)
        }else {
            time.append("0" + seconds.description)
        }
        
        
        return time
    }
}


// function plays sound
extension TimerViewModel {
    private func makeSoundAndVibration() {
        AudioServicesPlayAlertSoundWithCompletion(SoundID, nil)
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {
            
        }
    }
}
