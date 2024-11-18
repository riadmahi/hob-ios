//
//  ChatView.swift
//  Hob
//
//  Created by Riad on 09/11/2024.
//

import SwiftUI

struct Message {
    var id: Int
    var text: String
    var isSentByUser: Bool
}

struct ChatView: View {
    @State var text: String = ""
    @State var isKeyboardVisible = false

    let messages: [Message] = [
        Message(id: 1, text: "Salut, comment ça va ?", isSentByUser: true),
        Message(id: 2, text: "Ça va bien, merci ! Et toi ?", isSentByUser: false),
        Message(id: 3, text: "Je vais super bien, merci !", isSentByUser: true),
        Message(id: 4, text: "Super content de l'entendre !", isSentByUser: false),
        Message(id: 5, text: "Tu veux sortir ce week-end ?", isSentByUser: true),
        Message(id: 6, text: "Oui, pourquoi pas !", isSentByUser: false)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                    ForEach(messages, id: \.id) { message in
                        HStack {
                            if message.isSentByUser {
                                Spacer()
                                SentMessageBubble(message: message) { }
                                
                            } else {
                                ReceivedMessageBubble(message: message)
                                Spacer()
                            }
                        }
                }

            }
            ChatTextField(hint: "Écris ton message", text: $text)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .padding(.bottom, isKeyboardVisible ? 40 : 120)
        .padding(.horizontal, 12)
        .onAppear {
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillShowNotification,
                object: nil,
                queue: .main
            ) { _ in
                isKeyboardVisible = true
            }
            
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillHideNotification,
                object: nil,
                queue: .main
            ) { _ in
                isKeyboardVisible = false
            }
        }
        .onDisappear {
            // Remove observers when the view disappears
            NotificationCenter.default.removeObserver(self)
        }
    }

}




#Preview {
    ChatView()
}


import Combine

final class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0
    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { notification -> CGFloat in
                if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    return frame.height
                }
                return 0
            }

        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ -> CGFloat in
                return 0
            }

        Publishers.Merge(willShow, willHide)
            .subscribe(on: RunLoop.main)
            .assign(to: \.currentHeight, on: self)
            .store(in: &cancellableSet)
    }
}

struct KeyboardAdaptive: ViewModifier {
    @ObservedObject private var keyboard = KeyboardResponder()

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboard.currentHeight)
            .animation(.easeOut(duration: 0.16), value: keyboard.currentHeight)
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        self.modifier(KeyboardAdaptive())
    }
}
