//
//  NumberTextFieldView.swift
//  RuleOfThree
//
//  Created by Andrew Carvajal on 9/20/22.
//

import SwiftUI

struct NumberTextFieldView: View {
    
    @Binding var numberString: String
    
    var body: some View {
        TextField("", text: $numberString)
            .frame(width: screen.width * 0.3, height: screen.width * 0.3)
            .foregroundColor(Color("numberText"))
            .multilineTextAlignment(.center)
            .font(.system(size: 69))
            .fontWeight(.bold)
            .scaledToFit()
            .minimumScaleFactor(0.01)
            .lineLimit(1)
            .keyboardType(.decimalPad)
    }
}
