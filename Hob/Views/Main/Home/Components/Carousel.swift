//
//  Carousel.swift
//  Hob
//
//  Created by Riad on 12/11/2024.
//

import SwiftUI

struct Carousel: View {
    let photos: [String]
    @State private var currentTabIndex = 0
    
    var body: some View {
        TabView(selection: $currentTabIndex) {
            ForEach(photos.indices, id: \.self) { index in
                AsyncImage(url: URL(string: photos[index])) { result in
                    result.image?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        HStack(spacing: 6) {
            ForEach(photos.indices, id: \.self) { index in
                Circle()
                    .fill(currentTabIndex == index ? Color("AccentColor") : Color(hex: 0x7B3773))
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color("SecondaryContainerColor"))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.bottom, 10)
    }
}
