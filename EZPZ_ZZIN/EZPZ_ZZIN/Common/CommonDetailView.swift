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
    @Binding var accumulativeSum: Int
    var body: some View {
        
        let allString = "\(name).\n What is your character"
        let partialString = "character"
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            
            VStack(alignment: .leading){
                
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("Select one of these personalities below.")
                    .padding([.leading,.trailing])
                
                Spacer()
                Spacer()
                Spacer()
                
                VStack{
                    HStack{
                        CommonTendencynBtn(iCon: "🗿", msgText: "Serious", pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 0
                        }
                            .padding(.trailing, 2)
                        CommonTendencynBtn(iCon: "☀️", msgText: "Upbeat", pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 2
                        }
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    HStack{
                        CommonTendencynBtn(iCon: "🏖", msgText: "Free-spirited",pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 4
                        }
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "😵‍💫", msgText: "Indecisive",pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 8
                        }
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    
                    HStack{
                        CommonTendencynBtn(iCon: "🙈", msgText: "Timid", pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 10
                        }
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "👀", msgText: "None of these",pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 12
                        }
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
    @Binding var accumulativeSum: Int
    
    var body: some View {
        
        let allString = "\(name) \nWhere do you belong ?"
        let partialString = "belong"
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            
            VStack(alignment: .leading){
                
                
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("Select a keyword that describes yourself")
                    .padding([.leading,.trailing])
                
                Spacer()
                Spacer()
                Spacer()
                
                VStack{
                    HStack{
                        CommonTendencynBtn(iCon: "🗿", msgText: "Teenager", pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 0
                        }
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "☀️", msgText: "Univ. student", pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 1
                        }
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    HStack{
                        CommonTendencynBtn(iCon: "🏖", msgText: "Office worker",  pageNum: $pageNum, challengeIcon: $challengeIcon)  {
                            accumulativeSum += 2
                        }
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "😵‍💫", msgText: "Job-seeker",  pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 3
                        }
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    
                    HStack{
                        CommonTendencynBtn(iCon: "🙈", msgText: "Freelancer",  pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 4
                        }
                            .padding(.trailing,2)
                        CommonTendencynBtn(iCon: "👀", msgText: "None of these",  pageNum: $pageNum, challengeIcon: $challengeIcon) {
                            accumulativeSum += 5
                        }
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
    
    var allString = "Is there a challenge \nyou want to try??"
    var partialString = "want to try"
    @Binding var pageNum : Int
    @Binding var isTemplateRecommended: Bool
    @Binding var accumulativeSum: Int
    
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        
        VStack(alignment: .leading){
            
            Text(mainText)
                .padding([.leading,.trailing,.bottom])
                .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
            
            Spacer()
            OnBoardingMainButtonWithCustomAction(iCon: "🔥", msgText: "Yes, I have a challenge To-Do!", pageNum: $pageNum) {
                print("Yes, I have a challenge to do!")
                accumulativeSum += 3
                isTemplateRecommended = false
            }
            .padding(.bottom,2)
            OnBoardingMainButtonWithCustomAction(iCon: "🤙", msgText: "No! I need a recommendation.", pageNum: $pageNum, customAction: {
                print("No, I need a recommendation.")
                accumulativeSum += 0
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
    @Binding var isTemplateRecommended: Bool
    @Binding var accumulativeSum: Int

    var body: some View {
        
        let allString = "Select a field \nyou want to challenge"
        let partialString = "want to challenge"
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack {
            
            VStack(alignment: .leading) {
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("Choose one of these categories.")
                    .padding([.leading,.trailing])
                
                Spacer()
                Spacer()
                Spacer()
                
                VStack{
                    HStack{
                        CommonTendencynBtn2(iCon: "⚽️", msgText: "Workout", pageNum: $pageNum, challengeIcon: $challengeIcon, isTemplateRecommended: $isTemplateRecommended) {
                            accumulativeSum += 0
                        }
                            .padding(.trailing,2)
                        CommonTendencynBtn2(iCon: "🥗", msgText: "Health", pageNum: $pageNum, challengeIcon: $challengeIcon, isTemplateRecommended: $isTemplateRecommended) {
                            accumulativeSum += 1
                        }
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    HStack{
                        CommonTendencynBtn2(iCon: "📒", msgText: "Study", pageNum: $pageNum, challengeIcon: $challengeIcon, isTemplateRecommended: $isTemplateRecommended) {
                            accumulativeSum += 2
                        }
                            .padding(.trailing,2)
                        CommonTendencynBtn2(iCon: "⏳", msgText: "Habits", pageNum: $pageNum, challengeIcon: $challengeIcon, isTemplateRecommended: $isTemplateRecommended) {
                            accumulativeSum += 3
                        }
                    }.padding([.leading,.trailing],5)
                        .padding(.bottom,2)
                    
                    HStack{
                        CommonTendencynBtn2(iCon: "👀", msgText: "None of them", pageNum: $pageNum, challengeIcon: $challengeIcon, isTemplateRecommended: $isTemplateRecommended) {
                            accumulativeSum += 4
                        }
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
    var allString = "What challenge \nare you on?"
    var partialString = "challenge"
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
                Text("Let us know the title of the challenge.")
                    .padding([.leading,.trailing])
                Spacer()
                
                
                
                Text("Challenge title")
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                    .padding([.leading,.trailing])
                TextField("Enter a challenge title", text: $challenge)
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
                        CommonNextBtn(mainText: "Next", pageNum: $pageNum)
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

struct Template {
    let mainTitle: String
    let title: String
    let categoryInform: String
    let todoRows: [String]
    let index: Int
}

let A: [Template] = [
    Template(mainTitle: "👍 덤벨 하나 덜어내기", title: "10kg 빼기", categoryInform: "카테고리 운동", todoRows: ["하루 한 끼 샐러드", "저녁 유산소 30분씩 하기", "매일 맨몸운동 3세트씩 하기", "매일 아침 공복 몸무게 재기"], index: 0),
    Template(mainTitle: "👍 이제는 미룰 수 없다", title: "매일 하는 영어 공부", categoryInform: "카테고리 공부", todoRows: ["영단어 20개 외우기", "영어 기사 읽기", "BBC 뉴스 1개 보기"], index: 1),
    Template(mainTitle: "👍 일찍 일어나는 새가 으스댄다", title: "얼리버드의 삶", categoryInform: "카테고리 공부", todoRows: ["매일 5시 기상", "조간신문 읽기", "해 뜨는 것 사진찍기"], index: 2),
]

let B: [Template] = [
    Template(mainTitle: "👍 30만원의 행복", title: "한달 식비 30만원으로 살아보기", categoryInform: "카테고리 습관", todoRows: ["장보기", "하루에 집밥 2번 먹기", "가계부 쓰기"], index: 0),
    Template(mainTitle: "👍 젊은 날의 기록", title: "바디프로필 촬영", categoryInform: "카테고리 운동", todoRows: ["헬스장 가기", "단백질 보충제 먹기", "잠 일찍 자기(10시)", "스튜디오 상담"], index: 1),
    Template(mainTitle: "👍 내일은 나도 피카소", title: "드로잉 배우기", categoryInform: "카테고리 공부", todoRows: ["하루에 크로키 3개", "크로키 영상 보기", "인스타에 그린 것 올리기", "연필 깍기"], index: 2),
]

let C: [Template] = [
    Template(mainTitle: "👍 이제는 챙길 나이", title: "건강 챙기기", categoryInform: "카테고리 건강", todoRows: ["매일 영양제", "아침 따뜻한 물", "허리 핏자"], index: 0),
    Template(mainTitle: "👍 공인중개사 합격은...?", title: "공인중개사 자격 취득하기", categoryInform: "카테고리 공부", todoRows: ["하루에 기출 20문제", "하루에 인강 1강 보기", "인강 끊기"], index: 1),
    Template(mainTitle: "👍 쾌적한 삶의 시작", title: "정리하기", categoryInform: "카테고리 습관", todoRows: ["아침 이부자리 정리", "저녁 내일 일정 확인하기", "책상 정리하기", "방 청소하기"], index: 2),
]

let D: [Template] = [
    Template(mainTitle: "👍 10분만 걸어도 숨이 차요 ㅠㅠ", title: "일상속의 운동", categoryInform: "카테고리 운동", todoRows: ["출퇴근, 등교시 에스컬레이터 대신 계단을 이용해요", "아침 먹기전 10분씩 바닥에서 스트레칭을 해봐요", "스트레칭 유튜브 영상 하나 보기"], index: 0),
    Template(mainTitle: "👍 아~ 센델형~", title: "’정의란 무엇인가' 읽기", categoryInform: "카테고리 공부", todoRows: ["매일 20분 읽기", "한 줄 독후감", "독서 모임 나가기 "], index: 1),
    Template(mainTitle: "👍 #관리하는남자", title: "놓칠 수도 있는 것", categoryInform: "카테고리 습관", todoRows: ["집 밖에 나가기 전 선크림 바르기", "세수할 때, 눈썹 정리하기", "자기 전 손, 발톱 확인하기", "콧털 정리하기"], index: 2),
]

// 템플릿 추천 받기

struct CommonChallengeTemplateView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var allString = "Select a \nchallenge template"
    var partialString = "template"
    @Binding var challenge: String
    @Binding var pageNum : Int
    @Binding var accumulativeSum: Int
    @Binding var templateType: Int
    @Binding var templateIndex: Int
    
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            VStack(alignment: .leading){
                
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
                Text("You can customize the template later!")
                    .padding([.leading, .trailing])

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        
                        if 0 <= accumulativeSum && accumulativeSum <= 6 {
                            ForEach(A, id: \.title) { template in
                                TemplateView(mainTitle: template.mainTitle, title: template.title, categoryInform: template.categoryInform, todoRows: template.todoRows)
                                    .onTapGesture {
                                        print(accumulativeSum)
                                        challenge = template.title
                                        templateType = 0
                                        templateIndex = template.index
                                        withAnimation {
                                            pageNum += 1
                                        }
                                    }
                            }
                        } else if 7 <= accumulativeSum && accumulativeSum <= 12 {
                            ForEach(B, id: \.title) { template in
                                TemplateView(mainTitle: template.mainTitle, title: template.title, categoryInform: template.categoryInform, todoRows: template.todoRows)
                                    .onTapGesture {
                                        print(accumulativeSum)
                                        challenge = template.title
                                        templateType = 1
                                        templateIndex = template.index
                                        withAnimation {
                                            pageNum += 1
                                        }
                                    }
                            }
                        } else if 13 <= accumulativeSum && accumulativeSum <= 18 {
                            ForEach(C, id: \.title) { template in
                                TemplateView(mainTitle: template.mainTitle, title: template.title, categoryInform: template.categoryInform, todoRows: template.todoRows)
                                    .onTapGesture {
                                        print(accumulativeSum)
                                        challenge = template.title
                                        templateType = 2
                                        templateIndex = template.index
                                        withAnimation {
                                            pageNum += 1
                                        }
                                    }
                            }
                        } else if 19 <= accumulativeSum && accumulativeSum <= 24 {
                            ForEach(D, id: \.title) { template in
                                TemplateView(mainTitle: template.mainTitle, title: template.title, categoryInform: template.categoryInform, todoRows: template.todoRows)
                                    .onTapGesture {
                                        print(accumulativeSum)
                                        challenge = template.title
                                        templateType = 3
                                        templateIndex = template.index
                                        withAnimation {
                                            pageNum += 1
                                        }
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
    var allString = "Select a \nchallenge term"
    var partialString = "challenge term"
    
    //    @Binding var startDate = Date()
    //    @Binding var endDate = Date()
    //
    
    @Binding var startDate : Date
    @Binding var endDate : Date
    @Binding var pageNum : Int
    @Binding var toDayDate : Date // 설명하기에는 에메한..
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M.d.YYYY"
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
                    Text("Short-term challenge is also possible")
                        .padding([.leading,.trailing])
                    Spacer()
                    Text("Start Date")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 16))
                        .padding([.leading,.trailing])
                    
                }
                Group{
                    VStack {
                        DatePicker(selection: $startDate, in: Date()...,displayedComponents: .date) {
                            if startDate == toDayDate{
                                Text("Select a start date.")
                                    .font(.custom("SpoqaHanSansNeo",size: 16))
                                    .foregroundColor(ColorManage.ezpzSmokegrey)
                                
                            }else{
                                Text("\(startDate, formatter: CommonUserChallengeDateView.dateFormat)")
                            }
                        }
                        
                    }
                } .padding([.leading,.trailing,.bottom])
                
                if startDate != toDayDate{
                    Text("End date")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 16))
                        .padding([.leading,.trailing])
                    Group{
                        VStack {
                            DatePicker(selection: $endDate, in: startDate..., displayedComponents: .date) {
                                if endDate == toDayDate{
                                    Text("Select a end date.")
                                        .font(.custom("SpoqaHanSansNeo",size: 16))
                                        .foregroundColor(ColorManage.ezpzSmokegrey)
                                }else{
                                    Text("\(endDate, formatter: CommonUserChallengeDateView.dateFormat)")
                                }
                            } //아직 미완입니다.
                            
                        }
                    }
                    .padding([.leading,.trailing])
                }
                Spacer()
                Spacer()
             
                if  startDate != toDayDate &&  endDate != toDayDate && startDate <= endDate{
                    withAnimation {
                        CommonNextBtn(mainText: "Done", pageNum: $pageNum)
                    }//조건 추가해야됨 스킵
                }else if startDate != toDayDate && endDate != toDayDate && endDate < startDate{
                    Text("Please select the date again.")
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
