//
//  Shapes.swift
//  Bullseye
//
//  Created by Rich Polanco on 11/3/22.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: 200.00, height: 100.00)
                    .transition(.opacity)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height: 100.0)
                .animation(.easeInOut(duration: 0.5), value: wideShapes)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height: 100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height: 100.0)
            Button(action: {
                withAnimation{
                    wideShapes.toggle()
                }
            }) {
                Text("Animate")
            }
        }
        .background(Color.green)
    }
    
    struct Shapes_Previews: PreviewProvider {
        static var previews: some View {
            Shapes()
        }
    }
}
