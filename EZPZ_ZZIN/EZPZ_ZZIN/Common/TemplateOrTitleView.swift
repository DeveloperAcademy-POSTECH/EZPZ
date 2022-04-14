//
//  TemplateOrTitleView.swift
//  EZPZ_ZZIN
//
//  Created by Hyunjae Lee on 2022/04/14.
//

import SwiftUI

struct TemplateOrTitleView: View {
    
    @Binding var challenge: String
    @Binding var pageNum: Int
    @Binding var isTemplateRecommended: Bool
    
    var body: some View {
        if isTemplateRecommended {
            // 하고싶은 도전이 없는 경우 : 도전 템플릿 추천받기
            CommonChallengeTemplateView(challenge: $challenge, pageNum: $pageNum)
        } else {
            // 하고싶은 도전이 있는 경우 : 도전 명 바로 입력하기
            CommonUserChallengeView(challenge: $challenge, pageNum: $pageNum)
        }
    }
}
