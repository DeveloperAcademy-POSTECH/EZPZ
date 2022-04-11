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
        guard let startDate = challengeEntity.start else {
            print("도전 시작 날짜가 지정되어 있지 않음")
            return 0.0
        }
        guard let endDate = challengeEntity.end else {
            print("도전 종료 날짜가 지정되어 있지 않음")
            return 0.0
        }
        let currentDate: Date = Date()
        let numerator = startDate.distance(to: currentDate)
        let denominator = startDate.distance(to: endDate)
        
        // 0으로 나누는 경우가 생기지 않도록 예외 처리
        if denominator == 0 {
            return 1.0
        }
        var ratio: Double = numerator / denominator
        if ratio < 0.0 {
            // 0보다 작은 경우 0으로 처리
            ratio = 0.0
        } else if ratio > 1.0 {
            // 1보다 큰 경우 1로 처리
            ratio = 1.0
        }
        return ratio
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
