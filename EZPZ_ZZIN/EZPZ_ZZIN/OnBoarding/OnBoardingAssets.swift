//
//  OnBoardigAssets.swift
//  EZPZ
//
//  Created by Ruyha on 2022/04/09.
//
// RuyHa에게 물어보고 수정해주세요.
// 이거 잘못하면 저 울어요

import SwiftUI



struct EzpzProgressView: View {
    // 사용법
    // EzpzProgressView(gauge:50.0) Gauge에는 퍼센트를 넣어주시면 됩니다. 0.0 ~ 100.0
    var gauge : Double = 0.0
    var body: some View {
        ProgressView(value: gauge, total: 100)
            .tint(EzpzStyle.EzpzColor.ezpzLime)
            .frame(width: UIScreen.main.bounds.width / 3)
//            .progressViewStyle(LinearProgressViewStyle(tint:Color("ezpzLime")))
            .padding(.leading)
//            .padding(.trailing,200)
        
        
//        ProgressView(value: progressStatus,total: 1 )
               
    }
    
}


struct testppap: View {
    
    var gauge : Double = 0.0
    
    var body: some View {
        Text("🚀   작심삼일 탈출하기")
            .foregroundColor(Color.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .padding()
    }
}

struct OnBoardingMainBtn: View{
    var iCon = "아이콘"
    var msgText = "iCon과 msgText를 설정해주세요."
    @State var textcolor = [Color("ezpzDisdable")]
    var body : some View {
        Button(action: {
            // 페이지가 다음으로 넘어가야함
            textcolor = [Color("ezpzGradientPink"),Color("ezpzGradientLime")]
        }) {
            Text(iCon + "  " + msgText )
                .foregroundColor(Color.white)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(
                    LinearGradient(gradient: Gradient(colors: textcolor),
                                   startPoint: UnitPoint(x: 0, y: 3) , endPoint: UnitPoint(x: 1, y: 1))
                    ,lineWidth: 3
                    
                )
        )
        .padding([.leading,.trailing])
    }
}

func partialColorString(allString: String,allStringColor: Color ,partialString: String, partialStringColor: Color ) -> AttributedString {
    // 문자열의 부분 색상을 바꿔주는 함수입니다.
    // 온보딩에 자주 쓰이는데 똑같은 코드가 여기 저기 쓰이는걸 병적으로 싫어해서 한번 만들어 봤습니다.
    // 사용법은 간단합니다.
    
    // let mainText = partialColorString(allString: , allStringColor: , partialString: , partialStringColor: )
    // 상수 혹은 변수를 선언하고 = 뒤에를 복붙한뒤에
    // allString = 전체 문장 , allStringColor = 전체 문장 색상
    // partialString = 색상을 바꿀 문장, partialStringColor = 색생을 바꿀 문장 색상
    // 하면 끗 입니다.
    
    // 설명을 보충 조금만 더 하면 함수를 아는 사람은 쓸수 있을것 같다.
    //
    
    var string = AttributedString(allString)
    string.foregroundColor = allStringColor
    
    if let range = string.range(of: partialString) {
        string[range].foregroundColor = partialStringColor
    }
    
    return string
}


