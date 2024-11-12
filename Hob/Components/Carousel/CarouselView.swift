//
//  CarouselView.swift
//  hob
//
//  Created by Riad MAHI on 20/08/2024.
//

import SwiftUI

struct CarouselView: View {
    var photos: [String] = []
    var body: some View {
        let spacing: CGFloat = 0
        let widthOfHiddenCards: CGFloat = 0
        let cardHeight: CGFloat = 600
        return Canvas {
            Carousel(
                numberOfItems: CGFloat(photos.count),
                spacing: spacing,
                widthOfHiddenCards: widthOfHiddenCards
            ) {
                ForEach(Array(photos.enumerated()), id: \.offset) { index, item in
                    
                    Item(
                        _id: index, // Use index as unique identifier
                        spacing: spacing,
                        widthOfHiddenCards: widthOfHiddenCards,
                        cardHeight: cardHeight
                    ) {
                        
                        VStack {
                            AsyncImage(url: URL(string: item)) { result in
                                result.image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .cornerRadius(0)
                    .transition(AnyTransition.slide)
                    .animation(.spring)
                }
                
            }
        }
    }
}

public class UIStateModel: ObservableObject {
    @Published var activeCard: Int = 0
    @Published var screenDrag: Float = 0.0
}

struct Carousel<Items : View> : View {
    // Initializing necessary properties for the carousel
    // Including a timer for automatic sliding
    let items: Items
    let numberOfItems: CGFloat
    let spacing: CGFloat
    let widthOfHiddenCards: CGFloat
    let totalSpacing: CGFloat
    let cardWidth: CGFloat
    
    // Gesture state for drag detection
    @GestureState var isDetectingLongPress = false
    
    // Accessing UI state
    @EnvironmentObject var UIState: UIStateModel
        
    @inlinable public init(
        numberOfItems: CGFloat,
        spacing: CGFloat,
        widthOfHiddenCards: CGFloat,
        @ViewBuilder _ items: () -> Items) {
        
        // Setting up carousel parameters
        self.items = items()
        self.numberOfItems = numberOfItems
        self.spacing = spacing
        self.widthOfHiddenCards = widthOfHiddenCards
        self.totalSpacing = (numberOfItems - 1) * spacing
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2)
    }
    
    // Body of the carousel view
    var body: some View {
        // Calculating offset for active card and screen drag
        // Adjusting offset based on user interaction
        // Handling gesture and timer events
        let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
        let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
        let leftPadding = widthOfHiddenCards + spacing
        let totalMovement = cardWidth + spacing
                
        let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard))
        let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard) + 1)

        var calcOffset = Float(activeOffset)
        
        if (calcOffset != Float(nextOffset)) {
            calcOffset = Float(activeOffset) + UIState.screenDrag
        }
        
        return HStack(alignment: .center, spacing: spacing) {
            items
        }
        .offset(x: CGFloat(calcOffset), y: 0)
        // Gesture handling for drag detection and animation
        .gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
            // Évitez les modifications directes dans la mise à jour de la vue
            DispatchQueue.main.async {
                self.UIState.screenDrag = Float(currentState.translation.width)
            }
        }.onEnded { value in
            DispatchQueue.main.async {
                self.UIState.screenDrag = 0
                
                // Gestion des événements de glissement pour naviguer entre les cartes
                if (value.translation.width < -50) && self.UIState.activeCard < Int(numberOfItems) - 1 {
                    self.UIState.activeCard += 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }
                
                if (value.translation.width > 50) && self.UIState.activeCard > 0 {
                    self.UIState.activeCard -= 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }
            }
        })
    }
}

struct Canvas<Content : View> : View {
    let content: Content
    @EnvironmentObject var UIState: UIStateModel
    
    @inlinable init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}

struct Item<Content: View>: View {
    @EnvironmentObject var UIState: UIStateModel
    let cardWidth: CGFloat
    let cardHeight: CGFloat

    var _id: Int
    var content: Content

    @inlinable public init(
        _id: Int,
        spacing: CGFloat,
        widthOfHiddenCards: CGFloat,
        cardHeight: CGFloat,
        @ViewBuilder _ content: () -> Content
    ) {
        self.content = content()
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2)
        self.cardHeight = cardHeight
        self._id = _id
    }

    var body: some View {
          content
              .frame(maxWidth: cardWidth, maxHeight: .infinity, alignment: .center)
      }
}
