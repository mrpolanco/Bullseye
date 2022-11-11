//
//  ContentView.swift
//  Bullseye
//
//  Created by Rich Polanco on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsViews(game: $game)
                    .padding(.bottom, 100.0)
                HitMeButton(text: "Hit Me!", alertIsVisible: $alertIsVisible, game: $game, sliderValue: $sliderValue)
            }
            SliderView(sliderValue: $sliderValue)
        }
    }
}

struct InstructionsViews: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut your target as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text:String(game.target))
            
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    var text: String
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    @Binding var sliderValue: Double
    
    var body: some View {
        Button(text.uppercased()) {
            self.alertIsVisible = true
        }
        .bold()
        .font(.title3)
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
            })
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .foregroundColor(Color.white)
        .cornerRadius(25.0)
        
        // Alert Pop-up
        .alert("Hello there!", isPresented: $alertIsVisible) {
            Button("Awesome!") {
                let points = game.points(sliderValue: Int(sliderValue))
                game.startNewRound(points: points)
            }
        } message: {
            let roundedValue = Int(sliderValue)
            Text("The slider value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
