//
//  ContentView.swift
//  Bullseye
//
//  Created by Ilia on 16.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isHitAlertDisplayed: Bool = false
    @State private var sliderValue: Float = 50
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {

            BackgroundView(game: $game)
            VStack{
                if isHitAlertDisplayed {
                    PointsView(sliderValue: $sliderValue, game: $game, isHitAlertDisplayed: $isHitAlertDisplayed)
                } else {
                    InstructionsView(game: $game)
                        .padding(.bottom, isHitAlertDisplayed ? 0 : 100)
                        .transition(.scale)
                    HitMeButton(isHitAlertDisplayed: $isHitAlertDisplayed, sliderValue: $sliderValue, game: $game
                    )
                    .transition(.scale)
                }
            }
            if !isHitAlertDisplayed{
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}


struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            InstructionText(text:"🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text:(String(game.target)))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Float
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1...100).introspectSlider(){slider in
                let sliderImage: UIImage? = UIImage(named:"SliderImage")
                
                slider.setThumbImage(
                    sliderImage,
                    for: .normal)
            }
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var isHitAlertDisplayed: Bool
    @Binding var sliderValue: Float
    @Binding var game: Game
    
    var body: some View {
        Button(
            action:{
                withAnimation(){
                    isHitAlertDisplayed = true
                    sliderValue = 50.0
                }
            }
        ) {
            Text(
                "Hit me"
            )
            .bold()
            .font(.title3)
            .textCase(Text.Case.uppercase)
        }
        .padding(20.0)
        .background(
            ZStack{
                Color("ButtonColor")
                LinearGradient(
                    colors:[Color.white.opacity(0.3), Color.clear],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
