//
//  SecureHobTextField.swift
//  Hob
//
//  Created by Riad on 08/11/2024.
//


import SwiftUI

struct SecureHobTextField: View {
    var hint: String
    @Binding var password: String
    @Binding var isPasswordVisible: Bool
    
    var body: some View {
        if isPasswordVisible {
            TextField(
                hint,
                text: $password
            )
            .padding(.vertical, 18)
            .padding(.horizontal, 16)
            .background(Color("SecondaryContainerColor"))
            .textInputAutocapitalization(.never)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .font(Font.custom("BRSonoma-Regular", size: 16))
            .accentColor(Color("AccentColor"))
            .overlay(alignment: .trailing) {
                Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                    .padding()
                    .onTapGesture {
                        isPasswordVisible.toggle()
                    }
            }
        } else {
            SecureField(
                hint,
                text: $password
            )
            .padding(.vertical, 18)
            .padding(.horizontal, 16)
            .background(Color("SecondaryContainerColor"))
            .textInputAutocapitalization(.never)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .font(Font.custom("BRSonoma-Regular", size: 16))
            .accentColor(Color("AccentColor"))
            .overlay(alignment: .trailing) {
                Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                    .padding()
                    .onTapGesture {
                        isPasswordVisible.toggle()
                    }
            }
        }
    }
}

#Preview {
    PasswordTextFieldPreview()
}


struct PasswordTextFieldPreview: View {

    @State var password = ""
    @State var isPasswordVisible = false
    
    var body: some View {
        SecureHobTextField(hint: "Password", password: $password, isPasswordVisible: $isPasswordVisible)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
