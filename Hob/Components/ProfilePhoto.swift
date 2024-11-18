//
//  ProfilePhoto.swift
//  Hob
//
//  Created by Riad on 18/11/2024.
//


import SwiftUI

struct ProfilePhoto: View {
    let imageUrl: String
    let size: CGFloat
    var placeholderImage: Image = Image(systemName: "person.fill")

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: size, height: size)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            case .failure:
                placeholderImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            @unknown default:
                placeholderImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    ProfilePhoto(
        imageUrl: "https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        size: 45
    )
}
