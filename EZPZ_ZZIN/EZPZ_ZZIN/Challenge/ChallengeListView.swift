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
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \UserEntity.timestamp, ascending: true)])
    private var user: FetchedResults<UserEntity>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.timestamp, ascending: true)])
    private var todos: FetchedResults<TodoEntity>
    
    private func getUsername() -> String {
        // 유저 이름이 설정되지 않았을 때의 기본 값
        let defaultUsername: String = "린다"
        
        if user.isEmpty {
            return defaultUsername
        } else {
            return user[0].name ?? defaultUsername
        }
    }
    
    private func getTodaysTodo() -> [TodoEntity] {
        var result = [TodoEntity]()
        let cal = Calendar(identifier: .gregorian)
        let now = Date()
        let comps = cal.dateComponents([.weekday], from: now)
        let position = (comps.weekday! + 5) % 7
        let mask: Int64 = Int64(1 << position)
        for todoEntity in todos {
            if (todoEntity.mask & mask) != 0 {
                result.append(todoEntity)
            }
        }
        return result
    }
    
    private func countTodaysTodo() -> Int {
        let array = getTodaysTodo()
        return array.count
    }
    
    var body: some View {
        
        VStack {
            Spacer(minLength: 90)
            VStack(alignment: .leading, spacing: 10){
                Text(partialColorString(allString: "\(getUsername())님, 안녕하세요", allStringColor: .white, partialString: getUsername(), partialStringColor: Color("ezpzLime"))).padding([.leading,.trailing])
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
                    Text("      오늘 할 일이 \(countTodaysTodo())개 있어요!")
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
                        NavigationLink(destination: ChallengedetailView(challengeEntity: item)) {
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
                    var count: Int = 0 // 지금 하고 있는 도전의 개수
                    for challengeEntity in items {
                        if !isDPlus(endDate: challengeEntity.end ?? Date()) {
                            count += 1
                        }
                    }
                    if (count < 5) {
                        isShowingNewChallengeView = true
                    } else {
                        tooManyChallenges = true
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
    
    var body: some View {
        
        NavigationView {
            ZStack{
                
                ColorManage.ezpzBlack
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    VStack{
                        ChallengeWelcomeView()
                        MyChallenges()
                        
                    } // VStack
                } // ScrollView
                
            } // ZStack
            .navigationBarHidden(true)
            
        }
        
    }
}


