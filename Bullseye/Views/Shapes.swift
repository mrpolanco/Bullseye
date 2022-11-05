//
//  Shapes.swift
//  Bullseye
//
//  Created by Rich Polanco on 11/3/22.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(Color.white, lineWidth: 20.0)
                .frame(width: 200.00, height: 100.00)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
