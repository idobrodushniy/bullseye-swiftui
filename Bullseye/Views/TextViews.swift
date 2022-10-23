//
//  TextViews.swift
//  Bullseye
//
//  Created by Ilia on 18.10.2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .kerning(2.0)
            .textCase(Text.Case.uppercase)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}


struct BigNumberText: View {
    var text: String
    
    var body: some View{
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.caption)
            .kerning(1.5)
            .textCase(Text.Case.uppercase)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
            .font(.body)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .kerning(-0.2)
            .font(.title3)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View{
        Text(date, style: .time)
            .kerning(-0.2)
            .font(.title3)
            .bold()
            .foregroundColor(Color("TextColor"))
            .textCase(.uppercase)
    }
}

struct BoldTitleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .textCase(.uppercase)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
    }
}

struct PreviewTextViews: View {
    var body: some View {
        VStack{
            InstructionText(text:"Instructions")
            BigNumberText(text: "75")
            SliderLabelText(text: "1")
            LabelText(text:"Score")
            BodyText(text:"You scored 200 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
        }.padding()
        BoldTitleText(text: "Leaderboard")
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewTextViews()
        PreviewTextViews().preferredColorScheme(.dark)
    }
}

