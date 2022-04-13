//
//  CommonLastView.swift
//  EZPZ_ZZIN
//
//  Created by Ruyha on 2022/04/11.
//

import Foundation
import SwiftUI


struct CommonStartChallengeView_Previews: PreviewProvider {
    static var previews: some View {
      
        CommonStartChallengeView(userName:  .constant("John"), challenge:  .constant("John"), startDate:  .constant(Date()), endDate:  .constant(Date()), challengeIcon:  .constant("🍄"))
    }//대충 프리뷰
}



struct CommonStartChallengeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var userName: String
    @Binding var challenge: String
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var challengeIcon : String
    @State var textcolor = [Color("ezpzDisdable")]
    @State var overLineWidth : CGFloat = 1
    @Environment(\.presentationMode) var presentationMode
    var allString = "새로운 도전을\n만들었어요!"
    var partialString = "새로운 도전"
//
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.M.d"
        return formatter
    }()
    
    var body: some View {
        let mainText = partialColorString(allString: allString, allStringColor: .white, partialString: partialString, partialStringColor: Color("ezpzLime"))
        // OnBoardingAssets의 partialColorString()참고
        
        ZStack{
            VStack(alignment: .leading){
                Text(mainText)
                    .padding([.leading,.trailing])
                    .padding(.bottom,5)
                    .font(.custom("SpoqaHanSansNeo-Bold",size: 34))
               
                
                VStack(alignment: .center){
                    Text(challengeIcon)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 150))
                    
                    Text(challenge)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 24))
                        .foregroundColor(ColorManage.ezpzPink)
                    
                    Text("\(startDate, formatter: CommonStartChallengeView.dateFormat)~\(endDate, formatter: CommonStartChallengeView.dateFormat)")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
               
                }
               
                
                Spacer()
                
                
                
                
                Text("이제 리스트업 하러 가볼까요?")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding([.leading,.trailing])
                
                    Button(action: {
                        // 페이지가 다음으로 넘어가야함
                        textcolor = [Color("ezpzGradientPink"),Color("ezpzGradientLime")]
                        overLineWidth = 3.0
                        //데이터 저장
                        createChallenge()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("리스트업으로 가기")
                            .foregroundColor(ColorManage.ezpzLime)
                        
                    }
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(
                                LinearGradient(gradient: Gradient(colors: textcolor),
                                               startPoint: UnitPoint(x: 0, y: 3) , endPoint: UnitPoint(x: 1, y: 1)),lineWidth: overLineWidth
                            )
                    )//.background(RoundedRectangle(cornerRadius: 10).fill(ColorManage.ezpzLime)) //핑크 말고 다른방식으로 채우면 될 듯 한데....
                    //뭔가 가능할 것 같은데.. 킹받네..
                    .padding([.leading,.trailing])
                    .padding(.bottom,UIScreen.main.bounds.height / 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color("ezpzBlack"))
            
        }
        
    }


    
    func createChallenge() {
        let newChallenge: ChallengeEntity = ChallengeEntity(context: viewContext)
        newChallenge.start = startDate
        newChallenge.end = endDate
        newChallenge.title = challenge
        newChallenge.emoji = challengeIcon // TODO: 기본 이모지 변경하기
        newChallenge.timestamp = Date()
        let newUser: UserEntity = UserEntity(context: viewContext)
        newUser.name = userName
        newUser.timestamp = Date()
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}
