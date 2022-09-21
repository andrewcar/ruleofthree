//
//  ViewExtensions.swift
//  RuleOfThree
//
//  Created by Andrew Carvajal on 9/20/22.
//

import SwiftUI

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
