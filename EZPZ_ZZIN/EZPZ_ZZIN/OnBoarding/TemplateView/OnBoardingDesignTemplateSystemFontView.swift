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
                            Text("Your")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Text("username")
                                .font(.largeTitle)
                                .foregroundColor(EzpzStyle.EzpzColor.ezpzLime) +
                            Text("\nTell me.")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Spacer()
                        }.fixedSize(horizontal: false, vertical: true)
                        
                        HStack{
                            Text("Anyting is fine!")
                                .font(.body)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack{
                            Text("Username")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        TextField(
                            "Please write your username.",
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
