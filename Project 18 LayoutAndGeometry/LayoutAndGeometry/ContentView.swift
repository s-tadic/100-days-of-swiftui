//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Stefan Tadic on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<50) { index in
                        GeometryReader { geo in
                        Rectangle()
                            .fill(self.colors[index % 7])
                            .frame(height: 150)
                            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10), axis: (x: 0, y: 1, z: 0))
                        }
                        .padding(40)
                        .frame(width: 240)
                    }
                }
                .padding(.horizontal, (fullView.size.width - 150) / 2)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
        struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
