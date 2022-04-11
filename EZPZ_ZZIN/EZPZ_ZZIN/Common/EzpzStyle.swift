//
//  EzpzStyle.swift
//  EZPZ_ZZIN
//
//  Created by Yeni Hwang on 2022/04/11.
//

import SwiftUI

struct EzpzStyle {
    
    enum EzpzColor {
        
        // MARK: Main Colors
        static var ezpzPink = Color(UIColor(red: 255/255, green: 81/255, blue: 116/255, alpha: 1))
        static var ezpzBlack = Color(UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1))
        
        // MARK: Sub Color
        static var ezpzLime = Color(UIColor(red: 230/255, green: 255/255, blue: 92/255, alpha: 1))
        
        // MARK: Gradient Colors
        static var ezpzGradientPink = Color(UIColor(red: 255/255, green: 81/255, blue: 116/255, alpha: 1))
        static var ezpzGradientLime = Color(UIColor(red: 230/255, green: 255/255, blue: 92/255, alpha: 1))
        
        // MARK: Disable Color
        static var ezpzDisable = Color(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1))
        
        // MARK: Font Colors
        static var ezpzDarkgrey = Color(UIColor(red: 53/255, green: 53/255, blue: 53/255, alpha: 1))
        static var ezpzDeepgrey = Color(UIColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1))
        static var ezpzLightgrey = Color(UIColor(red: 255/255, green: 81/255, blue: 116/255, alpha: 1))
        static var ezpzSmokegrey = Color(UIColor(red: 138/255, green: 138/255, blue: 141/255, alpha: 1))
        
    }
    
    enum EzpzFont{
//        static var ezpzTitle1: Font = Font.custom("SpoqaHanSansNeo-Bold", size: 34, relativeTo: .largeTitle)
//        static var ezpzTitle2: Font = Font.custom("SpoqaHanSansNeo-Regular", size: 28, relativeTo: .title)
//        static var ezpzTitle3: Font = Font.custom("SpoqaHanSansNeo-Bold", size: 24, relativeTo: .title2)
//        static var ezpzTitle4: Font = Font.custom("SpoqaHanSansNeo-Bold", size: 18, relativeTo: .title3)
//        static var ezpzHeadline: Font = Font.custom("SpoqaHanSansNeo-Bold", size: 17, relativeTo: .headline)
//        static var ezpzBody: Font = Font.custom("SpoqaHanSansNeo-Regular", size: 17, relativeTo: .body)
//        static var ezpzCaption1: Font = Font.custom("SpoqaHanSansNeo-Regular", size: 12, relativeTo: .caption)
        
        static var ezpzTitle1: Font = Font.custom("AppleSDGothicNeo-Bold", size: 34, relativeTo: .largeTitle)
        static var ezpzTitle2: Font = Font.custom("AppleSDGothicNeo-Bold", size: 28, relativeTo: .title)
        static var ezpzTitle3: Font = Font.custom("AppleSDGothicNeo-Bold", size: 24, relativeTo: .title2)
        static var ezpzTitle4: Font = Font.custom("AppleSDGothicNeo-Bold", size: 18, relativeTo: .title3)
        static var ezpzHeadline: Font = Font.custom("AppleSDGothicNeo-Bold", size: 17, relativeTo: .headline)
        static var ezpzBody: Font = Font.custom("AppleSDGothicNeo-Regular", size: 17, relativeTo: .body)
        static var ezpzCaption1: Font = Font.custom("AppleSDGothicNeo-Regular", size: 12, relativeTo: .caption)
        
        
    }
    
    
    // TODO: - Margin, Padding을 비롯한 Spacing
    enum EzpzSpacing {
        
        // MARK: ezpzTitle1 (Large Title)
        static var defaultSpacing: Double = 10
        
    }
    
    
    // TODO: - text 일부분에 속성 넣어주기
//    enum AttributedText: CodableAttributedStringKey, MarkdownDecodableAttributedStringKey {
//
//        static var name: String
//
//        enum Value: String, Codable {
//            case plain
//                return .default
//            case extream
//                return
//        }
//
//    }
    
}

//  기본 폰트 리스트
//    뷰.onAppear{
//
//
//    for family: String in UIFont.familyNames {
//                    print(family)
//                    for names : String in UIFont.fontNames(forFamilyName: family){
//                        print("=== \(names)")
//                    }
//                }
//    }
