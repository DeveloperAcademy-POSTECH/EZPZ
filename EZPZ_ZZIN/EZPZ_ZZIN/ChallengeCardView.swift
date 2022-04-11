//
//  ChallengeCardView.swift
//  Journal
//
//  Created by Hyunjae on 4/7/22.
//

import SwiftUI

struct ChallengeCardView: View {
    
    @ObservedObject var challengeEntity: ChallengeEntity
    
    func getRatio() -> Double {
        let numerator = challengeEntity.start!.distance(to: Date())
        let denominator = challengeEntity.start!.distance(to: challengeEntity.end!)
        return numerator / denominator
    }
    
    func getPercentage() -> Int {
        return Int(getRatio() * 100.0)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(challengeEntity.emoji ?? "")
                    .font(.system(size: 18))
                Text(challengeEntity.title ?? "")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ezpzLime"))
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 18))
                    .foregroundColor(Color("ezpzPink"))
            }
            
            HStack {
                // TODO: D-Day로 변경하기
                Text("\(getPercentage())% 달성!")
                    .font(.system(size: 16))
                    .foregroundColor(Color("ezpzLightgrey"))
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.vertical, 10)
            
            ProgressView(value: getRatio())
                .progressViewStyle(LinearProgressViewStyle(tint: Color("ezpzLime")))
                .padding(.trailing, 20)
        }
        .frame(height: 110)
        .padding(.horizontal, 15)
        .background(Color("ezpzDeepgrey"))
        .cornerRadius(10)
    }
}
