//
//  MainHeader.swift
//  Hob
//
//  Created by Riad on 13/11/2024.
//

import SwiftUI

struct MainTopBar: View {
    var body: some View {
        HStack(alignment: .center) {
            HStack(spacing: 8) {
                AsyncImage(
                    url: URL(string: "https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
                ) { result in
                    result.image?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
                
                Text("Riad")
                    .brSonomaFont(.semiBold, 15)
            }
            Spacer()
            
            HStack {
                Text("Nouveaux profils dans ")
                    .brSonomaFont(.regular, 13)
                
                Text("6:34:56s")
                    .brSonomaFont(.semiBold, 13)
            }
        }
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, maxHeight: 50)
    }
}

#Preview {
    MainTopBar()
}
