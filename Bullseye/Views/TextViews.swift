//
//  TextViews.swift
//  Bullseye
//
//  Created by Rich Polanco on 10/24/22.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.black)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .kerning(1.5)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .kerning(-0.2)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 68.00, height: 56.00)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
    
}

struct TextPreviewView: View {
    
    var body: some View {
        VStack (spacing: 10.0) {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "1")
            LabelTextView(text: "Score")
            RoundRectTextView(text: "5")
        }
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextPreviewView()
            .preferredColorScheme(.dark)
        TextPreviewView()
    }
}


