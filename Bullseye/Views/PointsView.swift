//
//  PointsView.swift
//  Bullseye
//
//  Created by Ilia on 20.10.2022.
//

import SwiftUI
import Introspect

struct PointsView: View {
    @Binding var sliderValue: Float
    @Binding var game: Game
    @Binding var isHitAlertDisplayed: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue:roundedValue)
        
        VStack(spacing:10){
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(
                action:{
                    isHitAlertDisplayed = false
                    game.startNewRound(points: points)
                })
            {
                ButtonText(text: "Start New Round")
            }
            
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius:10, x: 5, y:5)
    }
}

struct CustomSlider: View {
    @State var sliderValue: Double = 10.0
    
    var body: some View {
        Slider(value: $sliderValue)
            .introspectSlider(){slider in
                let sliderImage: UIImage? = UIImage(named:"SliderImage")
                
                slider.setThumbImage(
                    sliderImage,
                    for: .normal)
            }
    }
}
struct PointsView_Previews: PreviewProvider {
    @State private var number = 150000.0
    
    static var previews: some View {
        PointsView(sliderValue: .constant(50.0), game: .constant(Game()), isHitAlertDisplayed: .constant(true))
        CustomSlider()
    }
}
