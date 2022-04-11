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
    var body: some View {
        TabView {
            Group{
                OnBoardingStartView()
                OnBoardingWellcomeView()
                OnBoardingUserNameView(name: $userName)
            
//                p()
            }
            //온보딩과 아닌것으로 분할 
            Group{
                CommonTendencyView(name: $userName)
                CommonUserGroupView(name: $userName)
                CommonWantChallenge()
                CommonUserFieldView()
                CommonUserChallengeView(challenge: $challenge)
                CommonUserChallengeDateView(startDate: $startDate, endDate: $endDate)
                CommonStartChallengeView(userName: $userName, challenge: $challenge, startDate: $startDate, endDate:  $endDate)
            }
        }.tabViewStyle(PageTabViewStyle())
       
        
    }
}




struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnBoardingView()
        }
    }
}
