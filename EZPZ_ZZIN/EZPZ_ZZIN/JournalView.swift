//
//  JournalView.swift
//  Journal
//
//  Created by Hyunjae on 4/7/22.
//

import SwiftUI
import CoreData

struct TopTabBarView: View {
    
    @Binding var isShowingCurrentChallenge: Bool
    
    var body: some View {
        VStack {
            // 상단 구분선
            CustomDividerView()
            
            HStack {
                Text("하고 있는 도전")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(isShowingCurrentChallenge ? Color("ezpzLightgrey") : Color("ezpzSmokegrey"))
                    .padding(.leading, 52)
                    .onTapGesture {
                        isShowingCurrentChallenge = true
                    }
                Spacer()
                Text(" 지난 도전 ")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(!isShowingCurrentChallenge ? Color("ezpzLightgrey") : Color("ezpzSmokegrey"))
                    .padding(.trailing, 60)
                    .onTapGesture {
                        isShowingCurrentChallenge = false
                    }
            }
            
            // 하단 구분선
            // 선택된 쪽이 강조된다
            HStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(isShowingCurrentChallenge ? Color("ezpzLightgrey") : Color("ezpzSmokegrey"))
                    .opacity(isShowingCurrentChallenge ? 1.0 : 0.3)
                    .frame(height: 1)
                    .edgesIgnoringSafeArea(.horizontal)
                    .padding(.bottom, 3)
                Rectangle()
                    .foregroundColor(!isShowingCurrentChallenge ? Color("ezpzLightgrey") : Color("ezpzSmokegrey"))
                    .opacity(!isShowingCurrentChallenge ? 1.0 : 0.3)
                    .frame(height: 1)
                    .edgesIgnoringSafeArea(.horizontal)
                    .padding(.bottom, 3)
            }
        }
    }
}

struct JournalView: View {
    @State var isShowingCurrentChallenge: Bool = true // true: 하고 있는 도전, false: 지난 도전
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ChallengeEntity.timestamp, ascending: true)])
    private var items: FetchedResults<ChallengeEntity>

    var body: some View {
        NavigationView {
            ZStack {
                Color("ezpzBlack")
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    TopTabBarView(isShowingCurrentChallenge: $isShowingCurrentChallenge)
                        .padding(.top, 10)
                    if isShowingCurrentChallenge {
                        ForEach(items) { item in
                            if !isDPlus(endDate: item.end) {
                                NavigationLink(destination: DailyView(challengeEntity: item)) {
                                    ChallengeCardView(challengeEntity: item)
                                        .padding(.top, 5)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    } else {
                        ForEach(items) { item in
                            if isDPlus(endDate: item.end) {
                                NavigationLink(destination: DailyView(challengeEntity: item)) {
                                    ChallengeCardView(challengeEntity: item)
                                        .padding(.top, 5)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("돌아보기")
        }
        .tint(Color("ezpzLightgrey"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
