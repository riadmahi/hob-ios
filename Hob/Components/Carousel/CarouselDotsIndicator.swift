//
//  CarouselDotsIndicator.swift
//  hob
//
//  Created by Riad MAHI on 20/08/2024.
//

import SwiftUI

struct CarouselDotsIndicator: View {
    @StateObject var carouselVM: CarouselViewModel
    var dots: Int = 0
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            //foreach with your items (array of image) from viewmodel/API
            ForEach(0..<dots, id: \.self) { index in
                Circle()
                    .frame(width: 7, height: 7)
                    .foregroundColor(index == carouselVM.activeCard ? Color("AccentColor") : Color(hex: 0x7B3773))
                    .overlay(Circle().stroke(Color.clear, lineWidth: 1))
                
            }
        }
        .padding(.vertical,5)
        .padding(.horizontal,12)
        .background(Color("SecondaryContainerColor"))
        .cornerRadius(12)
    }
}
