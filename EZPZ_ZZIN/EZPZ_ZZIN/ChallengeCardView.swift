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
    
    func getDDayString() -> String {
        guard let endDate = challengeEntity.end else {
            return "도전 종료 날짜가 지정되어 있지 않아요"
        }
        let currentDate: Date = Date()
        let difference: Double = endDate.distance(to: currentDate)
        let day: Int = Int(difference / (60 * 60 * 24)) // 시간 단위를 초에서 일로 변경
        if day < 0 {
            return "D\(day)"
        } else if day > 0 {
            return "D+\(day)"
        } else {
            return "D-Day"
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(challengeEntity.emoji ?? "")
                    .font(.system(size: 18))
                Text(challengeEntity.title ?? "")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color(isDPlus(endDate: challengeEntity.end) ? "ezpzPink" : "ezpzLime"))
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 18))
                    .foregroundColor(Color("ezpzPink"))
            }
            
            HStack {
                Text(getDDayString())
                    .font(.system(size: 16))
                    .foregroundColor(Color("ezpzLightgrey"))
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.vertical, 10)
            
            ProgressView(value: getRatio())
                .progressViewStyle(LinearProgressViewStyle(tint: Color(isDPlus(endDate: challengeEntity.end) ? "ezpzPink" : "ezpzLime")))
                .padding(.trailing, 20)
        }
        .frame(height: 110)
        .padding(.horizontal, 15)
        .background(Color("ezpzDeepgrey"))
        .cornerRadius(10)
    }
}

// 지난 도전이면 true를 반환한다. 하고 있는 도전이면 false를 반환한다.
func isDPlus(endDate: Date?) -> Bool {
    guard let end = endDate else {
        print("도전 종료 날짜가 지정되어 있지 않음")
        return false
    }
    let currentDate: Date = Date()
    let difference: Double = end.distance(to: currentDate)
    let day: Int = Int(difference / (60 * 60 * 24))
    return day > 0
}
