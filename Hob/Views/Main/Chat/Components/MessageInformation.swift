//
//  MessageInformation.swift
//  Hob
//
//  Created by Riad on 18/11/2024.
//

import SwiftUI

struct MessageInformation: View {
    let isMine: Bool
    let isSeen: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            Text("12:30 PM")
                .brSonomaFont(.regular, 10)
                .foregroundColor(isMine ? Color(hex: 0x970A6E) : Color("PlaceholderColor"))
            if isMine {
                if !isSeen {
                    Image(systemName: "checkmark")
                        .font(.caption2)
                        .foregroundColor(Color(hex: 0x970A6E))
                } else {
                    Image(systemName: "checkmark")
                        .font(.caption2)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
