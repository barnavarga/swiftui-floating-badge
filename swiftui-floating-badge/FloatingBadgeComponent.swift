//
//  FloatingBadgeComponent.swift
//  swiftui-floating-badge
//
//  Created by Barna Varga on 2020. 02. 02..
//  Copyright © 2020. Varga Barna E.V. All rights reserved.
//
import SwiftUI

struct FloatingBadgeComponent: View {
    struct Constants {
        static let padding: CGFloat = 10
        static let cornerRadius: CGFloat = 15
        static let actionIcon: String = "xmark"
    }

    let text: String
    let onActionTapGesture: () -> Void

    init(text: String, onActionTapGesture: @escaping () -> Void) {
        self.text = text
        self.onActionTapGesture = onActionTapGesture
    }

    var body: some View {
        
        return HStack {
            HStack {
                Text(text)
                    .foregroundColor(.white)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                Button(action: {
                    self.onActionTapGesture()
                }) {
                    Image(systemName: Constants.actionIcon)
                        .font(.caption)
                        .foregroundColor(Color.white)
                        .padding(5)
                }
            }
            .padding(.vertical, Constants.padding)
            .padding(.horizontal, Constants.padding)
            .background(Color.MaterialBlue600)
            .cornerRadius(Constants.cornerRadius)
            .shadow(color: Color.MaterialBlue600, radius: 5, x: 0, y: 0)
        }
        .padding(.top, 10)
        .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
        .animation(.easeInOut(duration: 0.25))
    }
}

struct FloatingBadgeComponent_Previews: PreviewProvider {
    static var previews: some View {
        FloatingBadgeComponent(text: "Test badge label", onActionTapGesture: {})
    }
}
