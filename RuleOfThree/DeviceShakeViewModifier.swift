//
//  DeviceShakeViewModifier.swift
//  RuleOfThree
//
//  Created by Andrew Carvajal on 9/20/22.
//

import SwiftUI

struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}
