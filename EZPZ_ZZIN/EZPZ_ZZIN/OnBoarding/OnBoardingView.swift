//
//  OnBoardingView.swift
//  EZPZ
//
//  Created by Ruyha on 2022/04/08.
//

import SwiftUI





struct OnBoardingView: View {
    
   // let elements: [Any] = [ppap1.self, ppap2.self,ppap3.self]
    
    var body: some View {
        TabView {
            Group{
                OnBoardingStartView()
                OnBoardingWellcomeView()
                OnBoardingUserNameView()
            }
            Group{
            
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
