//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Ilia on 22.10.2022.
//

import SwiftUI

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score).frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date:date).frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(
                    Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth
                )
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LabelView: View {
    var body: some View {
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "score").frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "date").frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Binding var leaderBoardShowing: Bool
    
    var body: some View{
        ZStack{
            HStack{
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    BoldTitleText(text: "leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BoldTitleText(text: "leaderboard")
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    leaderBoardShowing = false
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
        
    }
}

struct LeaderBoardView: View {
    @Binding var leaderBoardShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10){
                HeaderView(leaderBoardShowing: $leaderBoardShowing).padding(.top)
                LabelView()
                ScrollView{
                    VStack(spacing: 10){
                        ForEach(game.leaderboardEntries.indices){
                            i in let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            LeaderBoardView(leaderBoardShowing: .constant(true), game: .constant(Game(loadTestData: true)))
        }
    }
}
