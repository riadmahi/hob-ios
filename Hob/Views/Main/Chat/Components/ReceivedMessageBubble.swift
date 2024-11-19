//
//  ReceivedMessageBubble.swift
//  Hob
//
//  Created by Riad on 18/11/2024.
//

import SwiftUI

struct ReceivedMessageBubble: View {
    let message: Message
    var body: some View {
        VStack(alignment: .leading) {
            Text(message.content)
                .brSonomaFont(.medium, 15)
                .padding(.vertical, 2)
                .foregroundColor(.white)
            
            MessageInformation(isMine: false, isSeen: false)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color("ContainerColor"))
        .clipShape(RoundedRectangleCorners(radius: 12, corners: [.topLeft, .topRight, .bottomRight]))
        .clipShape(RoundedRectangleCorners(radius: 3, corners: [.bottomLeft]))
        .frame(maxWidth: 350, alignment: .leading)
        .contextMenu {
            Button {
                UIPasteboard.general.string = "message.content"
            } label: {
                Label("Copier", systemImage: "doc.on.doc")
            }
        }
    }
}
