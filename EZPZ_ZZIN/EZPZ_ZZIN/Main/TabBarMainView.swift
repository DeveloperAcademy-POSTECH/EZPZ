//
//  TabBarView.swift
//  EZPZ
//
//  Created by Ruyha on 2022/04/07.
//

import SwiftUI

struct TabBarMainView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("ezpzBlack"))
        // 탭바의 배경색을 ezpzBlack로 설정합니다.
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("ezpzLightgrey"))
        // 탭바 아이템의 기본 색상을(선택안된..) ezpzLightgrey로 설정합니다.
    }
    
    var body: some View {
   
        TabView {
//            Color("ezpzPink")
//            .ignoresSafeArea()
            // TabView라는 뷰입니다.
            RoutineView() //오늘할일 뷰를 만든뒤 뷰이름을 교체해 주세요.
                .tabItem { //탭바 아이탬에 대한 속성을 추가 합니다.
                    Image(systemName: "checkmark.square")
                    // 탭바 아이템의 이미지설정입니다.
                    Text("오늘할일")
                    // 탭바 아이템의 텍스트 설정입니다.
                }
            
            OnBoardingView() //내도전 뷰를 만든뒤 뷰이름을 교체해 주세요.
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("내도전")
                }
            
            OnBoardingDesignTemplateAppleFontView()  //돌아보기 뷰를 만든뒤 뷰이름을 교체해 주세요.
                .tabItem {
                    Image(systemName: "pencil")
                    Text("돌아보기")
                }
            
            OnBoardingDesignTemplateView()  //마이페이지 뷰를 만든뒤 뷰이름을 교체해 주세요.
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("마이페이지")
                }
            
            OnBoardingView() //내도전 뷰를 만든뒤 뷰이름을 교체해 주세요.
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("온보딩체킹")
                }
            
        }
       
        .accentColor(Color("ezpzPink")) // 탭바 아이템이 선택 되었을때의 색상을 설정해 줍니다.
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarMainView()
        
    }
}
