//
//  NotesView.swift
//  Hob
//
//  Created by Riad on 09/11/2024.
//

import SwiftUI

struct NotesView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<8) { _ in
                    NoteCard()
                }
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    NotesView()
}
