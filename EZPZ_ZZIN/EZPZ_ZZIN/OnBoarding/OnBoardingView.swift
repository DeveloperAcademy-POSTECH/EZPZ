//
//  OnBoardingView.swift
//  EZPZ
//
//  Created by Ruyha on 2022/04/08.
//

import SwiftUI





struct OnBoardingView: View {
    
    // let elements: [Any] = [ppap1.self, ppap2.self,ppap3.self]
    
    @State var userName: String = ""
    @State var challenge: String = ""
    
    @State var startDate = Date()
    @State var endDate = Date()
    
    //    @State var startDate: Date = 2022.02.01
    //    @State var endDate: Date =  2022.02.01
    //    func p() -> EmptyView {
    //        print("asdfasfd"  + userName)
    //        return EmptyView()
    //    }
    //
    
    @State private var selectedPage = 1

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
                    OnBoardingStartView().tag(1)
                    OnBoardingWellcomeView().tag(2)
                    OnBoardingUserNameView(name: $userName).tag(3)
                    
                    //                p()
                }
                //온보딩과 아닌것으로 분할
                Group{
                    CommonTendencyView(name: $userName).tag(4)
                    CommonUserGroupView(name: $userName).tag(5)
                    CommonWantChallenge().tag(6)
                    CommonUserFieldView().tag(7)
                    CommonUserChallengeView(challenge: $challenge).tag(8)
                    CommonUserChallengeDateView(startDate: $startDate, endDate: $endDate).tag(9)
                    CommonStartChallengeView(userName: $userName, challenge: $challenge, startDate: $startDate, endDate:  $endDate).tag(10)
                }
            }.tabViewStyle(PageTabViewStyle())
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
