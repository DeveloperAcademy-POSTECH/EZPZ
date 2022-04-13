//
//  ChallengeDeleteView.swift
//  EZPZ_ZZIN
//
//  Created by 최홍준 on 2022/04/12.
//

import SwiftUI

struct ChallengeDeleteView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ChallengeEntity.timestamp, ascending: true)])
    private var items: FetchedResults<ChallengeEntity>
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showAlert = false
    
    // 이 함수로 전달한 ChallengeEntity를 삭제한다.
    private func deleteChallengeEntity(challengeEntity: ChallengeEntity) {
        do {
            viewContext.delete(challengeEntity)
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .padding(.trailing, 30.0)
                            .padding(.top, 60.0)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                    }
                }
                ScrollView {
                    HStack {
                        Text("포기할 도전을 선택해주세요!")
                            .font(.system(size: 18))
                            .foregroundColor(Color("ezpzLightgrey"))
                            .padding(.leading, 30)
                        Spacer()
                    }
                    .padding(.top, 20)
                    CustomDividerView()
                    ForEach(items) { challengeEntity in
                        HStack {
                            Button(action: {
                                showAlert = true
                            }) {
                                Text("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("ezpzLime"))
                                    .padding(.leading, 30)
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("할 일을 삭제하시겠어요?"), message: Text("한 번 지운 할 일은 복구할 수 없어요..."), primaryButton: .destructive(Text("삭제하기"), action: {
                                    //some action
                                    deleteChallengeEntity(challengeEntity: challengeEntity)
                                } ), secondaryButton: .cancel(Text("돌아가기")))
                            }
                            Spacer()
                        }
                        CustomDividerView()
                    }
                }
            }
        }
    }
}

struct ChallengeDeleteView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDeleteView()
    }
}
