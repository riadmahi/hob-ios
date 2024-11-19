//
//  HobTabView.swift
//  Hob
//
//  Created by Riad on 09/11/2024.
//

import SwiftUI

enum HobTab: Int, CaseIterable {
    case explore = 0
    case notes
    case chat
    
    var iconName: String {
        switch self {
        case .explore:
            return "ExploreIcon"
        case .notes:
            return "NoteIcon"
        case .chat:
            return "ChatIcon"
        }
    }
    
    var title: String {
        switch self {
        case .explore:
            return "Explore"
        case .notes:
            return "Notes"
        case .chat:
            return "Chat"
        }
    }
}

struct HobTabView: View {
    @Binding var selectedTab: HobTab
    @State private var isKeyboardVisible: Bool = false
    var body: some View {
        HStack {
            if !isKeyboardVisible {
                ForEach(HobTab.allCases.indices, id: \.self) { index in
                    let tab = HobTab.allCases[index]
                    HobTabItem(
                        tab: tab,
                        isSelected: selectedTab == tab,
                        isLocked: isTabLocked(for: tab)
                    )
                    .onTapGesture {
                        if !isTabLocked(for: tab) {
                            selectedTab = tab
                        }
                    }
                    if index < HobTab.allCases.count - 1 {
                        let nextTab = HobTab.allCases[index + 1]
                        let shouldUseSolidLine = !isTabLocked(for: tab) && !isTabLocked(for: nextTab)
                        SeparatorLine(isSolid: shouldUseSolidLine)
                            .frame(width: 40)
                    }
                }
            }
        }
        .onAppear {
            // Observe keyboard notifications
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
    private func isTabLocked(for tab: HobTab) -> Bool {
        switch selectedTab {
        case .chat:
            return tab != .chat
        default:
            return tab == .chat
        }
    }
    
}


struct HobTabItem: View {
    let tab: HobTab
    var isSelected: Bool
    var isLocked: Bool
    
    private var selectedColor: Color {
        isSelected || !isLocked ? .white : Color(hex: 0x6E6B6B)
    }
    
    private var backgroundColor: Color {
        isSelected ? Color("AccentColor") : Color(hex: 0x434343)
    }
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Image(tab.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(selectedColor)
                    .padding(12)
                    .background(backgroundColor)
                    .clipShape(Circle())
                
                if isLocked {
                    Image("LockIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                        .foregroundColor(selectedColor)
                        .offset(x: 0, y: 24)
                }
            }
            Text(tab.title)
                .brSonomaFont(.medium, 12)
                .foregroundColor(selectedColor)
        }
        .padding(.vertical, 8)
    }
}

struct SeparatorLine: View {
    var isSolid: Bool
    
    var body: some View {
        Group {
            if isSolid {
                Rectangle()
                    .fill(Color(hex: 0x434343))
                    .frame(height: 1)
            } else {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .foregroundColor(Color(hex: 0x434343))
                    .frame(height: 1)
            }
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
struct HobTabView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
            .preferredColorScheme(.dark)
    }
    
    struct PreviewWrapper: View {
        @State private var selectedTab: HobTab = .explore
        
        var body: some View {
            HobTabView(selectedTab: $selectedTab)
        }
    }
}
