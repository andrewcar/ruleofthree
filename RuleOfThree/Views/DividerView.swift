//
//  DividerView.swift
//  RuleOfThree
//
//  Created by Andrew Carvajal on 9/20/22.
//

import SwiftUI

struct DividerView: View {
    
    var body: some View {
        Rectangle()
            .frame(width: screen.width * 0.3, height: 5)
            .foregroundColor(Color("numberText"))
    }
}
