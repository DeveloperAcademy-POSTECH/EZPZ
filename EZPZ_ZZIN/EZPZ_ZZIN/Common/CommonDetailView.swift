//
//  CommonDetailView.swift
//  EZPZ_ZZIN
//
//  Created by Ruyha on 2022/04/11.
//

import SwiftUI

struct CommonDetailView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct CommonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommonTendencyView(name: textValue)
//    }//대충 프리뷰
//}


struct CommonTendencyView: View {
    @Binding var name: String
    @Binding var pageNum : Int
    var body: some View {
       
        let allString = "\(name)의 성향을 알려주세요."
        let partialString = "성향"
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{

            VStack(alignment: .leading){
                
          
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("아래의 성격 중 하나를 선택해주세요.")
                    .padding([.leading,.trailing])
                
                Spacer()
                Spacer()
                Spacer()

                VStack{
                    HStack{
                        CommonTendencynBtn(iCon: "🗿", msgText: "진지함", pageNum: $pageNum)
                        CommonTendencynBtn(iCon: "☀️", msgText: "텐션이 높음", pageNum: $pageNum)
                    }.padding([.leading,.trailing],5)
                    HStack{
                        CommonTendencynBtn(iCon: "🏖", msgText: "자유로움", pageNum: $pageNum)
                        CommonTendencynBtn(iCon: "😵‍💫", msgText: "우유부단", pageNum: $pageNum)
                    }.padding([.leading,.trailing],5)

                    HStack{
                        CommonTendencynBtn(iCon: "🙈", msgText: "소심함", pageNum: $pageNum)
                        CommonTendencynBtn(iCon: "👀", msgText: "이 중에 없어요.", pageNum: $pageNum)
                    }.padding([.leading,.trailing],5)

                }
                .padding(.bottom,UIScreen.main.bounds.height / 10)


            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }
}


struct CommonUserGroupView: View {
    @Binding var name: String
    @Binding var pageNum : Int
    var body: some View {
       
        let allString = "\(name)은\n어디에 속하시나요?"
        let partialString = "어디"
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{

            VStack(alignment: .leading){
                
         
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("자신을 가장 잘 나타내는 키워드를 선택해주세요.")
                    .padding([.leading,.trailing])
                
                Spacer()
                Spacer()
                Spacer()

                VStack{
                    HStack{
                        CommonTendencynBtn(iCon: "🗿", msgText: "청소년", pageNum: $pageNum)
                        CommonTendencynBtn(iCon: "☀️", msgText: "대학생", pageNum: $pageNum)
                    }.padding([.leading,.trailing],5)
                    HStack{
                        CommonTendencynBtn(iCon: "🏖", msgText: "직장인", pageNum: $pageNum)
                        CommonTendencynBtn(iCon: "😵‍💫", msgText: "취준생", pageNum: $pageNum)
                    }.padding([.leading,.trailing],5)

                    HStack{
                        CommonTendencynBtn(iCon: "🙈", msgText: "프리랜서", pageNum: $pageNum)
                        CommonTendencynBtn(iCon: "👀", msgText: "이 중에 없어요.", pageNum: $pageNum)
                    }.padding([.leading,.trailing],5)

                }
                .padding(.bottom,UIScreen.main.bounds.height / 10)



            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }
}


struct CommonWantChallenge: View {
    
    var allString = "하고 싶은 도전이\n있나요?"
    var partialString = "하고 싶은 도전"
    @Binding var pageNum : Int
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
     
            VStack(alignment: .leading){
                
     
                Text(mainText)
                    .padding([.leading,.trailing,.bottom])
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                
                Spacer()
                OnBoardingMainBtn(iCon: "🔥", msgText: "네, 하고 싶은 도전이 있어요!", pageNum: $pageNum)
                OnBoardingMainBtn(iCon: "🤙", msgText: "아니요! 추천받을래요.", pageNum: $pageNum)
                    .padding(.bottom,UIScreen.main.bounds.height / 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
  
        
    }
    
    
}



struct CommonUserFieldView: View {
    @Binding var pageNum : Int
    var body: some View {
       
        let allString = "도전하고 싶은\n분야를 골라주세요."
        let partialString = "분야"
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{

            VStack(alignment: .leading){
                
 
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("아래의 카테고리 중 하나를 선택해 주세요.")
                    .padding([.leading,.trailing])
                
                Spacer()
                Spacer()
                Spacer()

                VStack{
                    HStack{
                        CommonTendencynBtn(iCon: "⚽️", msgText: "운동", pageNum: $pageNum)
                        CommonTendencynBtn(iCon: "🥗", msgText: "건강", pageNum: $pageNum)
                    }.padding([.leading,.trailing],5)
                    HStack{
                        CommonTendencynBtn(iCon: "📒", msgText: "공부", pageNum: $pageNum)
                        CommonTendencynBtn(iCon: "⏳", msgText: "습관", pageNum: $pageNum)
                    }.padding([.leading,.trailing],5)

                    HStack{
                        CommonTendencynBtn(iCon: "👀", msgText: "이 중에 없어요.", pageNum: $pageNum)
                            .padding(.trailing,UIScreen.main.bounds.width / 2)

                       
                           
                       // CommonTendencynBtn(iCon: "👀", msgText: "이 중에 없어요.")
                    }.padding([.leading,.trailing],5)

                }
                .padding(.bottom,UIScreen.main.bounds.height / 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
    }
}


struct CommonUserChallengeView: View {
    var allString = "어떤 도전을\n하시나요?"
    var partialString = "어떤 도전"
    @Binding var challenge: String
    @Binding var pageNum : Int
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            VStack(alignment: .leading){
                
       
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("도전명을 알려주세요.")
                    .padding([.leading,.trailing])
                Spacer()

            
                
                Text("도전명")
                    .padding([.leading,.trailing])
                TextField("도전명을 입력해주세요.", text: $challenge)
                    .keyboardType(.namePhonePad)
                    .submitLabel(.done)
                    .padding([.leading,.trailing])
                Divider()
                    .padding([.leading,.trailing])

                Spacer()
                Spacer()
                Spacer()
                if challenge != ""{
                    withAnimation {
                    CommonNextBtn(mainText: "NEXT", pageNum: $pageNum)
                    }
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }
}


struct CommonUserChallengeDateView: View {
    var allString = "도전 기간을\n선택해주세요."
    var partialString = "도전 기간"
    
//    @Binding var startDate = Date()
//    @Binding var endDate = Date()
//

    @Binding var startDate : Date
    @Binding var endDate : Date
    @Binding var pageNum : Int

    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()
    
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            VStack(alignment: .leading){
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("짧은 도전도 괜찮아요.")
                    .padding([.leading,.trailing])
                Spacer()
                Text("도전기간")
                    .padding([.leading,.trailing])
                Group{
                    VStack {
                        DatePicker(selection: $startDate, in: Date()...,displayedComponents: .date) {
                            Text("시작 날짜 :")
                            Text("\(startDate, formatter: CommonUserChallengeDateView.dateFormat)")
                        }

                    }
                    Divider()
                } .padding([.leading,.trailing])
              
                Group{
                VStack {
                    DatePicker(selection: $endDate, in: startDate..., displayedComponents: .date) {
                        Text("종료 날짜 :")
                        Text("\(endDate, formatter: CommonUserChallengeDateView.dateFormat)")
                    } //아직 미완입니다.
                    
                }
                Divider()
                } .padding([.leading,.trailing])
                   // .padding([.leading,.trailing])
                
                withAnimation {
                CommonNextBtn(mainText: "일단 스킵", pageNum: $pageNum)
                }//조건 추가해야됨 스킵
                
                Spacer()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }
}





//
//var body: some View {
//    VStack {
//        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
//            Text("날짜를 선택하세요")
//        }
//
//        Text("오늘의 날짜는 \(birthDate, formatter: ContentView.dateFormat) 입니다.")
//    }
//    .padding()
//}
//}
