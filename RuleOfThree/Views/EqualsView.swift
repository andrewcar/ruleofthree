//
//  EqualsView.swift
//  RuleOfThree
//
//  Created by Andrew Carvajal on 9/20/22.
//

import SwiftUI

struct EqualsView: View {
    
    var body: some View {
        Text("=")
            .frame(width: screen.width * 0.2, height: screen.height * 0.2)
            .foregroundColor(Color("numberText"))
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}
