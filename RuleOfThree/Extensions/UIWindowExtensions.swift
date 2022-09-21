//
//  UIWindowExtensions.swift
//  RuleOfThree
//
//  Created by Andrew Carvajal on 9/20/22.
//

import UIKit

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}
