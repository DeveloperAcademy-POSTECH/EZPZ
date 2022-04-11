//
//  OnBoardingDetailView.swift
//  EZPZ
//
//  Created by Ruyha on 2022/04/08.
//
//  OnBoarding view에 다 때려 박으면 끔찍할것 같아서 분할했습니다.
//  주석으로 상세 설명 추가
import SwiftUI


// PreView를 사용하기 위해 대충 만들었습니다.
// 의미가 있는건 아닙니다.
struct OnBoardigDetailView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

// PreView는 내가 그리는 뷰를 실시간으로 보여주고 재생버튼을 통해
// 실행또한 가능합니다. static var previews: some View { } 안에
// 뷰를 넣어주면 됩니다.
// TMI: UIkit은 이거 없어서 저는 빌드 계속 돌리면서 확인했습니다. ㅠㅠ
struct OnBoardigDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ppap1()
    }
}





struct ppap1: View {
    
    var allString = "EZPZ를 통해 무엇을 \n하고 싶은신가요?"
    var partialString = "EZPZ를 통해"
    
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            VStack(alignment: .leading){
                
                HStack{
                    EzpzProgressView(gauge:10.0)
                }
                .padding(.top,40)
                
                Text(mainText)
                    .padding()
                    .font(.system(size: 34))
                
                Spacer()
                OnBoardingMainBtn(iCon: "🚀", msgText: "작심삼일 탈출하기")
                OnBoardingMainBtn(iCon: "🧩", msgText: "이루고 싶었던 목표를 성취하기")
                    .padding(.bottom,40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
        }.preferredColorScheme(.dark)
    }
    
    
}

//struct OnBoardingLongLable: LabelStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        Label(configuration)
//            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//            .padding()
//            .background(Color.clear)
//
//            .border(.white, width: 1)
//            .cornerRadius(10)
//    }
//}



struct ppap2: View {
    var body: some View {
        Text("내도전2")
    }
}

struct ppap3: View {
    var body: some View {
        Text("내도전3")
    }
}

