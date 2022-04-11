//
//  CommonLastView.swift
//  EZPZ_ZZIN
//
//  Created by Ruyha on 2022/04/11.
//

import Foundation
import SwiftUI

struct CommonStartChallengeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var userName: String
    @Binding var challenge: String
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    var allString = "새로운 도전을\n만들었어요!"
    var partialString = "새로운 도전"
//
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            VStack(alignment: .leading){
                
                HStack{
                    EzpzProgressView(gauge:30.0)
                }
                .padding(.top,40)
                
                Text(mainText)
                    .padding([.leading,.trailing,.top])
                    .padding(.bottom,5)
                    .font(.system(size: 34))
               
           
                Spacer()
                Text("이제 리스트업 하러 가볼까요?")
                    .padding([.leading,.trailing])
                
                Button(action: {
                    // 데이터 저장
                    createChallenge()
                    
                    // 리스트 탭으로 이동
                }) {
                    HStack{
  
                        Text("리스트업으로 가기")
                            
                    } .foregroundColor(Color.white)
                  
                }.padding()
                    .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width / 2, alignment: .leading)
                   
                Spacer()

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }.preferredColorScheme(.dark)
        
    }
    
    func createChallenge() {
        let newChallenge: ChallengeEntity = ChallengeEntity(context: viewContext)
        newChallenge.start = startDate
        newChallenge.end = endDate
        newChallenge.title = challenge
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}
