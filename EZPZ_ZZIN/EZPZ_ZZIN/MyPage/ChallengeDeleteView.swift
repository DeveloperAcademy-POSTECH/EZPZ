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
    @State private var sharedChallengeEntity: ChallengeEntity? = nil
    
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
                        Text("Choose a challenge to give-up!")
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
                                sharedChallengeEntity = challengeEntity
                            }) {
                                Text("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("ezpzLime"))
                                    .padding(.leading, 30)
                            }
                            .alert(item: $sharedChallengeEntity) { entity in
                                Alert(title: Text("Are you sure you want to erase the task??"), message: Text("You can’t revert it..."), primaryButton: .destructive(Text("Delete"), action: {
                                    //some action
                                    deleteChallengeEntity(challengeEntity: entity)
                                } ), secondaryButton: .cancel(Text("Back")))
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
