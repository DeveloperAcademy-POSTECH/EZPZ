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
                    // 여기 패딩 넣으면... 왜 셀 크기가... 움직일까요...
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

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ChallengeEntity.timestamp, ascending: true)])
    private var items: FetchedResults<ChallengeEntity>
    @Binding var challengeCount: Int

    var body: some View {
            
        VStack{
            VStack(alignment: .leading, spacing: 10){
                Text("내 도전")
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 28))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                    .multilineTextAlignment(.leading).padding([.leading], 17).padding(.bottom, 0.1)
                
                Text("현재 \(challengeCount)개의 도전을 하고있어요")
                    .font(.custom("SpoqaHanSansNeo-Regular",size: 17))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                    .padding(.leading, 17)
                    Spacer()
            
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        
            
        }
        
        VStack{
            // 도전 목록
            ForEach(items) { item in
                
                if !isDPlus(endDate: item.end) {
                    
                    // TODO: - 각 도전별 도전 디테일 뷰로 연결 필요
                    NavigationLink(destination: DailyView(challengeEntity: item)) {
                        ChallengeCardView(challengeEntity: item)
                            .padding(.top, 5)
                    }
                } else {
                    EmptyView()
                }
            }
            
            // 도전 추가 버튼
            // TODO: - 도전 추가 뷰로 연결 필요
            Button(action: {
                print("도전 추가하기")
            }) {
                    Text(" +    새로운 도전 추가하기")
                    .padding(.leading, 20)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                    .frame(width: 370, height: 40, alignment: .leading)
                    .foregroundColor(ColorManage.ezpzDisable)
                    .background(ColorManage.ezpzDeepgrey)
                    .cornerRadius(10)
                }
        }.padding(.horizontal, 10)

        
    }
}


struct ChallengeListView: View {
    
    
    // TODO : - 유저 이름 바인딩 필요
    @State var userName: String = "기본이름"
    // TODO : - 오늘 해야하는 투두의 개수 바인딩 필요
    @State var todoCount: Int = 3
    // TODO : - 도전 개수 바인딩 필요 (items.count나 forEach로 카운팅을 해주려고 했는데 잘 안되네요ㅜㅜ)
    @State var challengeCount: Int = 1
    
        
    var body: some View {
        
        ZStack{
            
            ColorManage.ezpzBlack
                .ignoresSafeArea()
            
            ScrollView{
                
                VStack{
                    ChallengeWelcomeView(userName: $userName, todoCount: $todoCount)
                    MyChallenges(challengeCount: $challengeCount)

                } // VStack
            } // ScrollView
            
        } // ZStack
        
    }
}
            
