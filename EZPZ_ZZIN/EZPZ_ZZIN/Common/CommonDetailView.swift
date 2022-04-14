//
//  CommonDetailView.swift
//  EZPZ_ZZIN
//
//  Created by Ruyha on 2022/04/11.
//

import SwiftUI

struct CommonTendencyView: View {
    @Binding var name: String
    @Binding var pageNum : Int
    @Binding var challengeIcon : String
    var body: some View {
        
        let allString = "\(name)님의\n성향을 알려주세요"
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
                        CommonTendencynBtn(iCon: "🗿", msgText: "진지함", pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "☀️", msgText: "텐션이 높음", pageNum: $pageNum, challengeIcon: $challengeIcon)
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    HStack{
                        CommonTendencynBtn(iCon: "🏖", msgText: "자유로움",pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "😵‍💫", msgText: "우유부단",pageNum: $pageNum, challengeIcon: $challengeIcon)
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    
                    HStack{
                        CommonTendencynBtn(iCon: "🙈", msgText: "소심함", pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "👀", msgText: "이 중에 없어요",pageNum: $pageNum, challengeIcon: $challengeIcon)
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    
                }
                .padding(.bottom,UIScreen.main.bounds.height / 10)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }
}


struct CommonUserGroupView: View {
    let name: String
    @Binding var pageNum : Int
    @Binding var challengeIcon : String
    var body: some View {
        
        let allString = "\(name)님은\n어디에 속하시나요?"
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
                        CommonTendencynBtn(iCon: "🗿", msgText: "청소년", pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "☀️", msgText: "대학생", pageNum: $pageNum, challengeIcon: $challengeIcon)
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    HStack{
                        CommonTendencynBtn(iCon: "🏖", msgText: "직장인",  pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "😵‍💫", msgText: "취준생",  pageNum: $pageNum, challengeIcon: $challengeIcon)
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    
                    HStack{
                        CommonTendencynBtn(iCon: "🙈", msgText: "프리랜서",  pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "👀", msgText: "이 중에 없어요",  pageNum: $pageNum, challengeIcon: $challengeIcon)
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    
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
    @Binding var isTemplateRecommended: Bool
    
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        
        VStack(alignment: .leading){
            
            Text(mainText)
                .padding([.leading,.trailing,.bottom])
                .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
            
            Spacer()
            OnBoardingMainButtonWithCustomAction(iCon: "🔥", msgText: "네, 하고 싶은 도전이 있어요!", pageNum: $pageNum) {
                print("네, 하고 싶은 도전이 있어요!")
                isTemplateRecommended = false
            }
            .padding(.bottom,2)
            OnBoardingMainButtonWithCustomAction(iCon: "🤙", msgText: "아니요! 추천받을래요.", pageNum: $pageNum, customAction: {
                print("아니요! 추천받을래요.")
                isTemplateRecommended = true
            })
                .padding(.bottom,UIScreen.main.bounds.height / 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color("ezpzBlack"))
        
        
    }
    
    
}



struct CommonUserFieldView: View {
    @Binding var pageNum : Int
    @Binding var challengeIcon : String

    var body: some View {
        
        let allString = "도전하고 싶은\n분야를 골라주세요"
        let partialString = "분야"
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack {
            
            VStack(alignment: .leading) {
                
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
                        CommonTendencynBtn(iCon: "⚽️", msgText: "운동", pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "🥗", msgText: "건강", pageNum: $pageNum, challengeIcon: $challengeIcon)
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    HStack{
                        CommonTendencynBtn(iCon: "📒", msgText: "공부", pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "⏳", msgText: "습관", pageNum: $pageNum, challengeIcon: $challengeIcon)
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    
                    HStack{
                        CommonTendencynBtn(iCon: "👀", msgText: "이 중에 없어요", pageNum: $pageNum, challengeIcon: $challengeIcon)
                            .padding(.trailing,UIScreen.main.bounds.width / 2 + 2)
                        
                        
                        
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


// TODO: - 하고싶은 도전의 유무에 따라 도전 명을 입력하는 뷰와 템플릿 뷰 중에서 하나로 가야하는 상황인데, 어떤 기준으로 나눌 지
// 유저가 직접 도전 만들기

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
                        CommonNextBtn(mainText: "다음", pageNum: $pageNum)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }
}





// CommonChallengeTemplateView안에 들어갈
struct TemplateView: View {
    
    // 템플릿 밖
    var mainTitle: String
    
    // 템플릿 안
    var title: String
    var categoryInform: String
    var todoRows: [String]
    var body: some View {
        
        VStack(alignment: .leading) {
            
                Text(mainTitle)
                    .font(.custom("SpoqaHanSansNeo-Bold", size: 17))
                    .foregroundColor(Color("ezpzLightgrey"))
                    .padding(.bottom, 15)
                    .padding(.top, 30)

                VStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width * 4 / 5)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 10){
                            HStack(alignment: .top){
                                Text(title)
                                    .font(.custom("SpoqaHanSansNeo-Bold", size: 24))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                            }
                            Text(categoryInform)
                                .font(.custom("SpoqaHanSansNeo-regular", size: 13))
                                .foregroundColor(ColorManage.ezpzSmokegrey)
                                .padding(.leading, 20)
                                .padding(.bottom, 18)
                            
                            
                            ForEach(todoRows, id: \.self) { todo in
                                Text(todo)
                                    .padding(.leading, 20)
                                Divider()
                                    .background(ColorManage.ezpzSmokegrey)
                            }
                                
                            }
                            Spacer()
                        }.foregroundColor(ColorManage.ezpzBlack)
                            .frame(height: UIScreen.main.bounds.height * 5 / 11)
                            
                    

                }
            
            
        }
    }
}



// 템플릿 추천 받기

struct CommonChallengeTemplateView: View {
    var allString = "도전하고싶은\n템플릿을 골라주세요"
    var partialString = "템플릿"
    @Binding var challenge: String
    @Binding var pageNum : Int
    
    // example
    var Templates: [TemplateView] = [
        TemplateView(mainTitle: "👍 멘탈 케어 템플릿", title: "마음이 건강", categoryInform: "카테고리 건강", todoRows: ["저녁 먹고 차 마시기", "자기 전에 명상하기", "아침에 출근하면서 노래 듣기"]),
        TemplateView(mainTitle: "👍 멘탈 케어 템플릿", title: "마음이 건강", categoryInform: "카테고리 건강", todoRows: ["저녁 먹고 차 마시기", "자기 전에 명상하기", "아침에 출근하면서 노래 듣기"]),
        TemplateView(mainTitle: "👍 멘탈 케어 템플릿", title: "마음이 건강", categoryInform: "카테고리 건강", todoRows: ["저녁 먹고 차 마시기", "자기 전에 명상하기", "아침에 출근하면서 노래 듣기"])
    ]
    

    
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            VStack(alignment: .leading){
                
                
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("템플릿은 나중에 내 마음대로 수정 가능해요!.")
                    .padding([.leading,.trailing])
                

                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        
                        ForEach(0..<Templates.count) { i in
                            Templates[i]
                                .onTapGesture {
                                    withAnimation {
                                        challenge = Templates[i].title
                                        pageNum += 1
                                    }
                                }
                                
                        }
                            
                    }.padding(.leading, 15)
                        
                } // ScrollView
                    
            } // VStack
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color("ezpzBlack"))
            
    }
        
    
    
}









struct CommonUserChallengeDateView: View {
    var allString = "도전 기간을\n선택해주세요"
    var partialString = "도전 기간"
    
    //    @Binding var startDate = Date()
    //    @Binding var endDate = Date()
    //
    
    @Binding var startDate : Date
    @Binding var endDate : Date
    @Binding var pageNum : Int
    @Binding var toDayDate : Date // 설명하기에는 에메한..
    
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
                Group{
                    Text(mainText)
                        .padding([.leading,.trailing])
                        .padding(.bottom,5)
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                    Text("짧은 도전도 괜찮아요.")
                        .padding([.leading,.trailing])
                    Spacer()
                    Text("시작 날짜")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 16))
                        .padding([.leading,.trailing])
                    
                }
                Group{
                    VStack {
                        DatePicker(selection: $startDate, in: Date()...,displayedComponents: .date) {
                            if startDate == toDayDate{
                                Text("시작 날짜를 선택해 주세요.")
                                    .font(.custom("SpoqaHanSansNeo",size: 16))
                                    .foregroundColor(ColorManage.ezpzSmokegrey)
                                
                            }else{
                                Text("\(startDate, formatter: CommonUserChallengeDateView.dateFormat)")
                            }
                        }
                        
                    }
                } .padding([.leading,.trailing,.bottom])
                
                if startDate != toDayDate{
                    Text("종료 날짜")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 16))
                        .padding([.leading,.trailing])
                    Group{
                        VStack {
                            DatePicker(selection: $endDate, in: startDate..., displayedComponents: .date) {
                                if endDate == toDayDate{
                                    Text("종료 날짜를 선택해 주세요.")
                                        .font(.custom("SpoqaHanSansNeo",size: 16))
                                        .foregroundColor(ColorManage.ezpzSmokegrey)
                                }else{
                                    Text("\(endDate, formatter: CommonUserChallengeDateView.dateFormat)")
                                }
                            } //아직 미완입니다.
                            
                        }
                    } .padding([.leading,.trailing])
                    // .padding([.leading,.trailing])
                }
                /// 시작 날자를 설정해야지 보이게 만든다.
                ///
                Spacer()
                Spacer()
             
                if  startDate != toDayDate &&  endDate != toDayDate && startDate <= endDate{
                    withAnimation {
                        CommonNextBtn(mainText: "저장하기", pageNum: $pageNum)
                    }//조건 추가해야됨 스킵
                }else if startDate != toDayDate && endDate != toDayDate && endDate < startDate{
                    Text("날짜를 다시 설정해 주세요.")
                        .font(.custom("SpoqaHanSansNeo",size: 16))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        //.foregroundColor(ColorManage.ezpzSmokegrey)
                        .padding(.bottom,UIScreen.main.bounds.height / 10)
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }
}
