//
//  SettingField.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//
import SwiftUI

struct SettingField: View {
    var fieldName: String
    var field: String
    var disabled: Bool = false
    var action: () -> Void
    var body: some View {
        Button(action: action){
            VStack {
                HStack {
                    VStack {
                        Text(fieldName)
                            .brSonomaFont(.medium, 13)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("PlaceholderColor"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(field)
                            .brSonomaFont(.medium, 15)
                            .padding(.horizontal, 6)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Image("ArrowRightIcon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("PlaceholderColor"))
                }.padding(.vertical, 2)
                Divider()
            }
        }
        .disabled(disabled)
        .opacity(disabled ? 0.7 : 1)
    }
}

#Preview {
    SettingField(fieldName: "Prénom", field: "Riad"){ }
}
