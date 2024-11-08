//
//  HobTextField.swift
//  Hob
//
//  Created by Riad MAHI on 22/08/2024.
//

import SwiftUI

struct HobTextField: View {
    var hint: String
    @Binding var text: String
    var uiKeyboardType: UIKeyboardType = .default
    var body: some View {
        TextField(
            hint,
            text: $text
        )
        .font(.brSonomaFont(.regular, 16))
        .padding(.vertical, 18)
        .padding(.horizontal, 16)
        .background(Color("SecondaryContainerColor"))
        .textInputAutocapitalization(.never)
        .keyboardType(uiKeyboardType)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .accentColor(Color("AccentColor"))
    }
}

#Preview {
    HobTextFieldPreview()
}

struct HobTextFieldPreview: View {
    @State var text = ""
    
    var body: some View {
        HobTextField(hint: "Email", text: $text)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
