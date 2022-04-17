//
//  ContentView.swift
//  ChallengeComplete
//
//  Created by 이주화 on 2022/04/08.
//

import SwiftUI

struct ChallengecompleteView: View {
    @State var challengeText = ""
    var body: some View {
        ZStack{
            ColorManage.ezpzBlack
                .ignoresSafeArea()
            VStack{
                HStack{
                Text("Save")
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 35)
                        Spacer()
                }.padding(.bottom, 30)
                
                Group{
                    HStack{
                Text("Edit Challenge")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 28))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                        .multilineTextAlignment(.leading).padding([.leading], 17)
                        Spacer()
                    }
                    HStack{
                        Text("Tab the contents you want to change!")
                            .font(.custom("SpoqaHanSansNeo-Regular",size: 17))
                            .foregroundColor(ColorManage.ezpzLightgrey)
                            .padding(.leading, 17)
                            Spacer()
                    }.padding(.bottom, 40)
                }
                HStack{
                    Text("⚽️")
                        .font(.system(size: 120))
                }.padding(.bottom,10)
                HStack{
                    Text("100일동안 5kg 빼기")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 24))
                        .foregroundColor(ColorManage.ezpzPink)

                }
                HStack{
                    Text("2022.03.12~2022.05.30")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                        .foregroundColor(ColorManage.ezpzLightgrey)

                }
                Spacer()
            }
                
            }
        }
}

struct ChallengecompleteView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengecompleteView()
    }
}


struct ColorManage1{
    static let ezpzLime = Color("ezpzLime")
    static let ezpzPink = Color("ezpzPink")
    static let ezpzBlack = Color("ezpzBlack")
    static let ezpzDarkgrey = Color("ezpzDarkgrey")
    static let ezpzDeepgrey = Color("ezpzDeepgrey")
    static let ezpzDisdable = Color("ezpzDisdable")
    static let ezpzLightgrey = Color("ezpzLightgrey")
    static let ezpzSmokegrey = Color("ezpzSmokegrey")
    static let ezpzGradient = Color("ezpzGradient")
    static let ezpzGradient_ = Color("eezpzGradient_")
}
