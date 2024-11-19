//
//  ChatHeader.swift
//  Hob
//
//  Created by Riad on 18/11/2024.
//

import SwiftUI

struct ChatTopBar: View {
    var body: some View {
        HStack(alignment: .center) {
            HStack(spacing: 8) {
                ProfilePhoto(imageUrl: "https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", size: 45)
                Text("Riad")
                    .brSonomaFont(.semiBold, 15)
            }
            
            Spacer()
            
            Menu {
                Button(action: {
                    print("Voir le profil de Safia")
                }) {
                    Text("Voir le profil de Safia")
                }
                Button(action: {
                    print("Voir mon profil")
                }) {
                    Text("Voir mon profil")
                }
                Button(action: {
                    print("Dématcher")
                }) {
                    Text("Dématcher")
                        .foregroundColor(.red)
                }
            } label: {
                Image("HDotsIcon")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("PlaceholderColor"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
    }
}

