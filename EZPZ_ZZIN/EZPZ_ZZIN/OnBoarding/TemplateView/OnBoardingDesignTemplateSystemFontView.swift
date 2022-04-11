//
//  OnBoardingDesignTemplateSystemFontView.swift
//  EZPZ_ZZIN
//
//  Created by Yeni Hwang on 2022/04/11.
//

import SwiftUI

struct OnBoardingDesignTemplateSystemFontView: View {
    
    @State private var progressStatus = 0.4
    @State private var userName: String = ""
    
    var body: some View {
        ZStack{
            
            Color("ezpzBlack")
            VStack{
                
                Spacer(minLength: 80)
                
                VStack{
                    
                    HStack{
                        
                        ProgressView(value: progressStatus,total: 1 )
                                .tint(EzpzStyle.EzpzColor.ezpzLime)
                                .frame(width: UIScreen.main.bounds.width / 3)
                            Spacer()

                    }
                
                    VStack(alignment: .leading, spacing: EzpzStyle.EzpzSpacing.defaultSpacing){
                        
                        HStack{
                            Text("이름")
                                .font(.largeTitle)
                                .foregroundColor(EzpzStyle.EzpzColor.ezpzLime) +
                            Text("을\n알려주세요.")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Spacer()
                        }.fixedSize(horizontal: false, vertical: true)
                        
                        HStack{
                            Text("닉네임도 좋아요!")
                                .font(.body)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack{
                            Text("이름")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        TextField(
                            "이름 또는 닉네임을 적어주세요.",
                            text: $userName)
                        
                        Divider().foregroundColor(EzpzStyle.EzpzColor.ezpzLightgrey)    /*.padding(EzpzStyle.EzpzSpacing.defaultSpacing)*/
                        
                        Spacer(minLength: 300)

                    }
                    
            }.frame(alignment: .topLeading)
                
                Spacer()
            
            }.padding()
        }
    }
}

struct OnBoardingDesignTemplateSystemFontView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
