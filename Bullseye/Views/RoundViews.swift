//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Rich Polanco on 11/4/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    @State private var game: Game = Game()
    
    var body: some View {
        
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width:Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedTextView: View {
    let text: String

    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct PreviewView: View {
    
    var body: some View {
        VStack(spacing: 10.0) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedTextView(text: String(1))
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
            .preferredColorScheme(.dark)
        PreviewView()
    }
}
