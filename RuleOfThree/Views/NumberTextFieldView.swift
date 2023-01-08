//
//  NumberTextFieldView.swift
//  RuleOfThree
//
//  Created by Andrew Carvajal on 9/20/22.
//

import SwiftUI

struct NumberTextFieldView: View {
    
    @Binding var numberString: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("", text: $numberString)
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? screen.width * 0.4 : screen.width * 0.3,
                   height: UIDevice.current.userInterfaceIdiom == .pad ? screen.width * 0.4 : screen.width * 0.3)
            .foregroundColor(Color("numberText"))
            .multilineTextAlignment(.center)
            .font(.system(size: UIDevice.current.userInterfaceIdiom == .pad ? 88 : 69))
            .fontWeight(.bold)
            .scaledToFit()
            .minimumScaleFactor(0.01)
            .lineLimit(1)
            .keyboardType(.decimalPad)
            .focused($isFocused)
            .onTapGesture {
                isFocused = true
            }
    }
}
