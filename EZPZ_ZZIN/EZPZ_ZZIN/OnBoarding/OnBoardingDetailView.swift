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
//struct OnBoardigDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingStartView()
//    }
//}





struct OnBoardingStartView: View {
    
    var allString = "What do you want  \nWith EZPZ?"
    var partialString = "With EZPZ"
    @Binding var pageNum : Int
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
           
            VStack(alignment: .leading){
        
                Text(mainText)
                    .padding([.leading,.trailing,.bottom])
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Spacer()
                OnBoardingMainBtn(iCon: "🚀", msgText: "Finish three days hump", pageNum: $pageNum)
                    .padding(.bottom,2)
                OnBoardingMainBtn(iCon: "🧩", msgText: "Achieving your goals", pageNum: $pageNum)
                    .padding(.bottom,UIScreen.main.bounds.height / 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
        
    }
    
    
}


struct OnBoardingWellcomeView: View {
    var allString = "Ezpz is \njust right for you!"
    var partialString = "right for you!"
    @Binding var pageNum : Int
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        
      
            VStack(alignment: .leading){
                
        
          
                Text(mainText)
                    .padding([.leading,.trailing,.bottom])
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                
                Spacer()
                Spacer()
                Spacer()
                CommonNextBtn(mainText: "To start EZPZ", pageNum: $pageNum)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
        
    }
}

struct OnBoardingUserNameView: View {
    var allString = "Tell me \nYour username"
    var partialString = "Username"
    @Binding var name: String
    @Binding var pageNum : Int
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            VStack(alignment: .leading){
          
                Text(mainText)
//                    .padding([.leading,.trailing,.top])
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("Anyting is fine!")
                    .padding([.leading,.trailing])
                Spacer()

            
                
                Text("Username")
                    .padding([.leading,.trailing])
                TextField("Please write your username.", text: $name)
                    .keyboardType(.namePhonePad)
                    .submitLabel(.done)
                    .padding([.leading,.trailing])
                Divider()
                    .padding([.leading,.trailing])
                Spacer()
                Spacer()
                Spacer()
                if name != ""{
                    withAnimation {
                    CommonNextBtn(mainText: "Next", pageNum: $pageNum)
                    }
                }
              
            
                

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }
}

