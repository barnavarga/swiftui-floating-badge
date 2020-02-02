//
//  ContentView.swift
//  swiftui-floating-badge
//
//  Created by Barna Varga on 2020. 02. 02..
//  Copyright © 2020. Varga Barna E.V. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var show: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            if show {
                FloatingBadgeComponent(text: "Hello, World!", onActionTapGesture: {})
            }
            VStack {
                Button(action: {
                    self.show.toggle()

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.show.toggle()
                    }
                }, label: {
                    Text("Show `Floating Badge` component")
                        .padding(.horizontal, 25)
                        .padding(.vertical, 15)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .font(.caption)
                })
                    .disabled(self.show)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var show: Bool = true
    static var previews: some View {
        ContentView()
    }
}
