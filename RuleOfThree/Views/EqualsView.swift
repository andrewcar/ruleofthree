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
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? screen.width * 0.1 : screen.width * 0.2,
                   height: UIDevice.current.userInterfaceIdiom == .pad ? screen.width * 0.1 : screen.height * 0.2)
            .foregroundColor(Color("numberText"))
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}
