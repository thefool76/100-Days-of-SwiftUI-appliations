//
//  Extension+Double.swift
//  TimerApp
//
//  Created by Bhavesh Mishra on 12/08/24.
//

import SwiftUI

extension Double {
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour,.minute,.second,.nanosecond]
        formatter.unitsStyle = style
        return formatter.string(from: self) ?? ""
    }
}
