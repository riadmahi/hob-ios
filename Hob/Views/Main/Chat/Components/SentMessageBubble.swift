//
//  SentMessageBubble.swift
//  Hob
//
//  Created by Riad on 18/11/2024.
//

import SwiftUI

struct SentMessageBubble: View {
    let message: Message
    let deleteAction: () -> Void
    var body: some View {
            VStack(alignment: .trailing) {
                Text(message.text)
                    .brSonomaFont(.medium, 15)
                    .padding(.vertical, 2)
                    .foregroundColor(.white)
                
                MessageInformation(isMine: true, isSeen: false)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(.accent)
            .clipShape(RoundedRectangleCorners(radius: 12, corners: [.topLeft, .topRight, .bottomLeft]))
            .clipShape(RoundedRectangleCorners(radius: 3, corners: [.bottomRight]))
            .frame(maxWidth: 300, alignment: .trailing)
            .contextMenu {
                Button {
                    UIPasteboard.general.string = "message.content"
                } label: {
                    Label("Copier", systemImage: "doc.on.doc")
                }
                Button(role: .destructive) {
                    deleteAction()
                } label: {
                    Label("Supprimer", systemImage: "trash")
                }
            }
        }

}


struct RoundedRectangleCorners: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

