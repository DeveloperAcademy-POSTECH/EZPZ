//
//  CommonView.swift
//  EZPZ_ZZIN
//
//  Created by Ruyha on 2022/04/13.
//

import SwiftUI

struct CommonView: View {
    @State var selectedPage = 1
    @State var challengeIcon = ""
    @State var challenge: String = ""
    @State var startDate = Date()
    @State var endDate = Date()
    @State var toDayDate = Date()
    @State var isTemplateRecommended: Bool = false

    // CoreData 관련 코드
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \UserEntity.timestamp, ascending: true)])
    private var user: FetchedResults<UserEntity>
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        let gagtePage = Double(selectedPage * 15)
        ZStack{
            
            ColorManage.ezpzBlack
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                EzpzProgressView(gauge:gagtePage)
                
                
                
                TabView(selection: $selectedPage) {
                    Group{
                        CommonTendencyView(name:.constant(getUsername()),pageNum: $selectedPage, challengeIcon: .constant("")).tag(1)
                        CommonUserGroupView(name: getUsername() ,pageNum: $selectedPage, challengeIcon: .constant("")).tag(2)
                        CommonWantChallenge(pageNum: $selectedPage, isTemplateRecommended: $isTemplateRecommended).tag(3)
                        CommonUserFieldView(pageNum: $selectedPage, challengeIcon: $challengeIcon, isTemplateRecommended: $isTemplateRecommended).tag(4)
                        
                        CommonChallengeTemplateView(challenge: $challenge, pageNum: $selectedPage).tag(5)
                        CommonUserChallengeView(challenge: $challenge, pageNum: $selectedPage).tag(6)
                        
                        CommonUserChallengeDateView(startDate: $startDate, endDate: $endDate, pageNum: $selectedPage, toDayDate: $toDayDate).tag(7)
                        CommonStartChallengeView(userName: .constant(getUsername()), challenge: $challenge, startDate: $startDate, endDate:  $endDate,challengeIcon: $challengeIcon, isTemplateRecommended: isTemplateRecommended).tag(8)
                    }
                    .gesture(DragGesture())
                }
                .tabViewStyle(PageTabViewStyle())
                
//                    .disabled(true) 이거 쓰면 모든 동작 밴당함
            }
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        
    }
    
    func getUsername() -> String {
        
        // 유저 이름이 설정되지 않았을 때의 기본 값
        let defaultUsername: String = "린다"
        
        if user.isEmpty {
            return defaultUsername
        } else {
            return user[0].name ?? defaultUsername
        }
    }
    
    
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                Text("내 도전으로 이동") //translated Back button title
            }
        }
    }
    
    
}

struct CommonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonView()
    }
}
