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
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                HStack {
                    Text("포기할 도전을 선택해주세요!")
                        .font(.system(size: 18))
                        .foregroundColor(Color("ezpzLightgrey"))
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding(.top, 20)
                CustomDividerView()
                ForEach(items) { challengeEntity in
                    HStack {
                        Text("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color("ezpzLime"))
                            .padding(.leading, 15)
                        Spacer()
                    }
                    CustomDividerView()
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
