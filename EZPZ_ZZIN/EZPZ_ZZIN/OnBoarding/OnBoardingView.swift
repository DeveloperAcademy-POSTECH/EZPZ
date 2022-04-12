//
//  OnBoardingView.swift
//  EZPZ
//
//  Created by Ruyha on 2022/04/08.
//

import SwiftUI





struct OnBoardingView: View {
    
    // let elements: [Any] = [ppap1.self, ppap2.self,ppap3.self]
    
    init() {
        UIPageControl.appearance().isUserInteractionEnabled = false
        // 해당 뷰에서 TabView의 UIPageControl를 유저가 클릭해 다음페이지로 이동 못하게 제한함.
       }
    
    @State var userName: String = ""
    @State var challenge: String = ""
    
    @State var startDate = Date()
    @State var endDate = Date()
    @State var toDayDate = Date()
    @State var selectedPage = 1
    @State var challengeIcon = ""
    var body: some View {
        let gagtePage = Double(selectedPage * 10)
        ZStack{
            
            ColorManage.ezpzBlack
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                EzpzProgressView(gauge:gagtePage)
                    .padding(.top,UIScreen.main.bounds.height / 16)
                
                
                TabView(selection: $selectedPage) {
                    Group{
                        // selectedPage 이거를 페이지 마다 전달해서
                        // 특정 상황일떄 값을 추가 하든 해서 다음페이지로 이동시키면 될듯
                        OnBoardingStartView(pageNum: $selectedPage).tag(1)
                        OnBoardingWellcomeView(pageNum: $selectedPage).tag(2)
                        OnBoardingUserNameView(name: $userName,pageNum: $selectedPage).tag(3)
                    }
                    .gesture(DragGesture())
                    // .simultaneousGesture(DragGesture())
                    //그룹 단위로 제스쳐를 막을 수 있는 것 같다.
                    // .gesture(DragGesture())와 .simultaneousGesture(DragGesture())의 차이는 잘 모르겠다.

                    //온보딩과 아닌것으로 분할
                    Group{
                        CommonTendencyView(name: $userName ,pageNum: $selectedPage, challengeIcon: .constant("")).tag(4)
                        CommonUserGroupView(name: $userName ,pageNum: $selectedPage, challengeIcon: .constant("")).tag(5)
                        CommonWantChallenge(pageNum: $selectedPage).tag(6)
                        CommonUserFieldView(pageNum: $selectedPage, challengeIcon: $challengeIcon).tag(7)
                        CommonUserChallengeView(challenge: $challenge, pageNum: $selectedPage).tag(8)
                        CommonUserChallengeDateView(startDate: $startDate, endDate: $endDate, pageNum: $selectedPage, toDayDate: $toDayDate).tag(9)
                        CommonStartChallengeView(userName: $userName, challenge: $challenge, startDate: $startDate, endDate:  $endDate,challengeIcon: $challengeIcon).tag(10)
                    }
                    .gesture(DragGesture())
                }
                
                .tabViewStyle(PageTabViewStyle())
                
//                    .disabled(true) 이거 쓰면 모든 동작 밴당함
            }
        }
        
    }
}




struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnBoardingView()
        }
    }
}
