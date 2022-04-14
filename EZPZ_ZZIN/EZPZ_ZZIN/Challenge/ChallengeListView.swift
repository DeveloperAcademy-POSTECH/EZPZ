//
//  ChallengeListView.swift
//  EZPZ_ZZIN
//
//  Created by Yeni Hwang on 2022/04/14.
//

import SwiftUI
import CoreData
import Foundation

struct ChallengeWelcomeView: View {
    
    @Binding var userName: String
    @Binding var todoCount: Int
    
    var body: some View {
        
        let userWelcomeString = "\(userName)님, 안녕하세요"
        let welcomeString = partialColorString(allString: userWelcomeString, allStringColor: .white, partialString: userName, partialStringColor: Color("ezpzLime"))
        
        VStack {
            Spacer(minLength: 90)
            VStack(alignment: .leading, spacing: 10){
                Text(welcomeString).padding([.leading,.trailing])
                    .padding(.bottom, 12)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 28))
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            
            
            ZStack{
                
                Rectangle()
                    .cornerRadius(10)
                    .frame(width: 370 , height: 40)
                    .foregroundColor(ColorManage.ezpzDarkgrey)
                
                
                VStack{
                    // 여기 패딩 넣으면... 왜 카드의 셀 크기가... 움직일까요...
                    Text("      오늘 할 일이 \(todoCount)개나 있어요!")
                        .frame(width: 370, alignment: .leading)
                        .font(.custom("SpoqaHanSansNeo-Regular",size: 17))
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }.padding(.bottom, 24)
    }
}

struct MyChallenges: View {
    
    // from Journal Tab
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ChallengeEntity.timestamp, ascending: true)])
    private var items: FetchedResults<ChallengeEntity>
    
    // Alert
    @State private var nowChallengesCount: Int = 0
    // TODO: - Maximum 값 지정 필요
    @State private var maximumChallengesCount: Int = 5
    @State private var tooManyChallenges = false
    @State private var isShowingNewChallengeView: Bool = false
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading, spacing: 10){
                Text("내 도전")
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 28))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                    .multilineTextAlignment(.leading).padding([.leading], 17).padding(.bottom, 0.1)
                
                Text("현재 \(items.count)개의 도전을 하고있어요")
                    .font(.custom("SpoqaHanSansNeo-Regular",size: 17))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                    .padding(.leading, 17)
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            VStack {
                // 도전 목록
                ForEach(items) { item in
                    
                    if !isDPlus(endDate: item.end) {
                        
                        // TODO: - 각 도전별 도전 디테일 뷰로 연결 필요
                        NavigationLink(destination: ChallengedetailView()) {
                            ChallengeCardView(challengeEntity: item)
                                .padding(.top, 5)
                        }
                    } else {
                        EmptyView()
                    }
                }
                .padding(.horizontal, 10)
                
                
                NavigationLink(isActive: $isShowingNewChallengeView) {
                    CommonView()
                } label: {
                    EmptyView()
                }
                .hidden()
                
                // 도전 추가 버튼
                
                Button(action: {
                    if (!tooManyChallenges) {
                        isShowingNewChallengeView = true
                        
                        // TODO: CoreData Work
                        nowChallengesCount += 1
                        if (nowChallengesCount == maximumChallengesCount) {
                            tooManyChallenges = true
                        }
                    }
                }){
                    Text(" +    새로운 도전 추가하기 (최대 5개)")
                        .padding(.leading, 20)
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                        .frame(width: 370, height: 40, alignment: .leading)
                        .foregroundColor(ColorManage.ezpzDisable)
                        .background(ColorManage.ezpzDeepgrey)
                        .cornerRadius(10)
                }
                .padding(.all, 10)
                .alert(isPresented: $tooManyChallenges){
                    Alert(
                        title: Text("도전이 많이 남아 있어요...!")
                            .font(.custom("SpoqaHanSansNeo-Semibold",size: 22)),
                        message: Text("남은 도전부터 해치워봐요!")
                            .font(.custom("SpoqaHanSansNeo-Regular",size: 18)),
                        dismissButton:
                                .default(Text("확인")
                                    .font(.custom("SpoqaHanSansNeo-Semibold", size: 22)))
                    )
                    // "확인"버튼을 ezpzPink로 바꾸려고 했는데 .accentColor도 안되고 .tint도 안됩니다.
                }
                .foregroundColor(ColorManage.ezpzDarkgrey)
                
            }
        }
    }
}


struct ChallengeListView: View {
    
    
    // TODO : - 유저 이름 바인딩 필요
    @State var userName: String = "기본이름"
    // TODO : - 오늘 해야하는 투두의 개수 바인딩 필요
    @State var todoCount: Int = 3
    
    
    var body: some View {
        
        NavigationView {
            ZStack{
                
                ColorManage.ezpzBlack
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    VStack{
                        ChallengeWelcomeView(userName: $userName, todoCount: $todoCount)
                        MyChallenges()
                        
                    } // VStack
                } // ScrollView
                
            } // ZStack
            .navigationBarHidden(true)
            
        }
        
    }
}


