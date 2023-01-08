//
//  ContainerView.swift
//  RuleOfThree
//
//  Created by Andrew Carvajal on 9/20/22.
//

import SwiftUI

enum Field {
    case topLeft
    case bottomLeft
    case topRight
    case bottomRight
}

struct ContainerView: View {
    
    @State private var topLeftNumberString: String = ""
    @State private var bottomLeftNumberString: String = ""
    @State private var topRightNumberString: String = ""
    @State private var bottomRightNumberString: String = "✕"
    @FocusState private var focusedField: Field?
    @ObservedObject var keyboardHeightHelper = KeyboardHeightHelper()
    
    private var resultNumberString: String {
        guard let topLeftNumber = Float(topLeftNumberString) else { return "✕" }
        guard let bottomLeftNumber = Float(bottomLeftNumberString) else { return "✕" }
        guard let topRightNumber = Float(topRightNumberString) else { return "✕" }
        let floatResult = (bottomLeftNumber * topRightNumber) / topLeftNumber
        let intResult = Int(floatResult)
        if Float(intResult) == floatResult {
            return "\(intResult)"
        } else {
            return "\(floatResult)"
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 10) {
                    VStack(spacing: 0) {
                        NumberTextFieldView(numberString: $topLeftNumberString)
                            .focused($focusedField, equals: .topLeft)
                            .submitLabel(.next)
                        DividerView()
                        NumberTextFieldView(numberString: $bottomLeftNumberString)
                            .focused($focusedField, equals: .bottomLeft)
                            .submitLabel(.next)
                    }
                    .onSubmit {
                        updateFocusedField()
                    }
                    EqualsView()
                    VStack {
                        NumberTextFieldView(numberString: $topRightNumberString)
                            .focused($focusedField, equals: .topRight)
                            .submitLabel(.go)
                        DividerView()
                        NumberTextFieldView(numberString: $bottomRightNumberString)
                    }
                    .onSubmit {
                        focusedField = nil
                        bottomRightNumberString = resultNumberString
                    }
                }
            }
            VStack {
                Spacer()
                nextButtonView
            }
        }
        .frame(width: screen.width, height: screen.height)
        .edgesIgnoringSafeArea(.all)
        .background(Color("background"))
        .onShake {
            reset()
        }
        .onAppear {
            focusedField = .topLeft
        }
    }
    
    var nextButtonView: some View {
        Button {
            switch focusedField {
            case .topLeft:
                focusedField = .bottomLeft
            case .bottomLeft:
                focusedField = .topRight
            default:
                focusedField = nil
                bottomRightNumberString = resultNumberString
            }
        } label: {
            Text(focusedField == .topRight ? "Solve" : "Next")
                .frame(width: screen.width - 10, height: 50)
                .foregroundColor(Color("nextButtonText"))
                .background(Color("nextButtonBackground"))
                .cornerRadius(7)
        }
        .offset(y: focusedField == nil ? screen.height : -(keyboardHeightHelper.keyboardHeight / 1.5))
    }
    
    private func updateFocusedField() {
        switch focusedField {
        case .topLeft:
            focusedField = .bottomLeft
        case .bottomLeft:
            focusedField = .topRight
        default:
            focusedField = nil
        }
    }
    
    private func reset() {
        topLeftNumberString = ""
        bottomLeftNumberString = ""
        topRightNumberString = ""
        bottomRightNumberString = "✕"
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
