//
//  ChatTextField.swift
//  Hob
//
//  Created by Riad on 18/11/2024.
//

import SwiftUI

struct ChatTextField: View {
    var hint: String
    @Binding var text: String
    var body: some View {
        HStack(alignment: .center) {
            TextField(
                hint,
                text: $text,
                axis: .vertical
            )
            .font(.brSonomaFont(.regular, 16))
            .textInputAutocapitalization(.never)
            .lineLimit(5)
            .keyboardType(.default)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .accentColor(Color("AccentColor"))
            .gesture(
                DragGesture(minimumDistance: 20, coordinateSpace: .local)
                    .onEnded { value in
                        if value.translation.height > 0 {
                            UIApplication.shared.endEditing()
                        }
                    }
            )
            
            if !text.isEmpty {
                Button(action: {
                    UIApplication.shared.endEditing()
                }) {
                    HStack {
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color("AccentColor"))
                    }
                    .background(.white)
                    .clipShape(Circle())
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(Color("SecondaryContainerColor"))
        .animation(.easeInOut(duration: 0.3), value: text)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}


#Preview {
    ChatTextField(hint: "Écris ton message ici...", text: .constant(""))
}
