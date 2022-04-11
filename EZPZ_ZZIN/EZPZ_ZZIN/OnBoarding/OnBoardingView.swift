//
//  OnBoardingView.swift
//  EZPZ_ZZIN
//
//  Created by Yeni Hwang on 2022/04/11.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        return GeometryReader { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
              
                    ForEach(0..<3) { index in
                        switch index{
                        case 0:
                            ppap1()
                        case 1:
                            ppap2()
                        default:
                            ppap3()
                        }
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    
                    
                }
            }
        }.onAppear {
            UIScrollView.appearance().isPagingEnabled = true
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
