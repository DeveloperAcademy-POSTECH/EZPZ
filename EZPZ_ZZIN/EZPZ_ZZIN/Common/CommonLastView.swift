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
    @Binding var challengeIcon : String
    @State var textcolor = [Color("ezpzDisdable")]
    @State var overLineWidth : CGFloat = 1
    @Environment(\.presentationMode) var presentationMode
    var allString = "Set up \na new challenge!"
    var partialString = "Set up"
    
    let isTemplateRecommended: Bool
    @Binding var templateType: Int
    @Binding var templateIndex: Int
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M.d.YYYY"
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
                
                Text("Let’s list the tasks up")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding([.leading,.trailing])
                
                    Button(action: {
                        // 페이지가 다음으로 넘어가야함
                        textcolor = [Color("ezpzGradientPink"),Color("ezpzGradientLime")]
                        overLineWidth = 3.0
                        
                        // 도전 생성
                        createChallenge()
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Text("Go to My Challenge")
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

    private func createChallenge() {
        let newChallenge: ChallengeEntity = ChallengeEntity(context: viewContext)
        newChallenge.start = startDate
        newChallenge.end = endDate
        newChallenge.title = challenge
        newChallenge.emoji = challengeIcon // TODO: 기본 이모지 변경하기
        newChallenge.timestamp = Date()
        let newUser: UserEntity = UserEntity(context: viewContext)
        newUser.name = userName
        newUser.timestamp = Date()
        
        // 템플릿을 추천받은 경우 Todo 추가
        if isTemplateRecommended {
            if templateType == 0 {
                let labels: [String] = A[templateIndex].todoRows
                for label in labels {
                    let newTodo: TodoEntity = TodoEntity(context: viewContext)
                    newTodo.timestamp = Date()
                    newTodo.isChecked = false
                    newTodo.mask = (1 << 7) - 1
                    newTodo.label = label
                    newTodo.toChallenge = newChallenge
                }
            } else if templateType == 1 {
                let labels: [String] = B[templateIndex].todoRows
                for label in labels {
                    let newTodo: TodoEntity = TodoEntity(context: viewContext)
                    newTodo.timestamp = Date()
                    newTodo.isChecked = false
                    newTodo.mask = (1 << 7) - 1
                    newTodo.label = label
                    newTodo.toChallenge = newChallenge
                }
            } else if templateType == 2 {
                let labels: [String] = C[templateIndex].todoRows
                for label in labels {
                    let newTodo: TodoEntity = TodoEntity(context: viewContext)
                    newTodo.timestamp = Date()
                    newTodo.isChecked = false
                    newTodo.mask = (1 << 7) - 1
                    newTodo.label = label
                    newTodo.toChallenge = newChallenge
                }
            } else if templateType == 3 {
                let labels: [String] = D[templateIndex].todoRows
                for label in labels {
                    let newTodo: TodoEntity = TodoEntity(context: viewContext)
                    newTodo.timestamp = Date()
                    newTodo.isChecked = false
                    newTodo.mask = (1 << 7) - 1
                    newTodo.label = label
                    newTodo.toChallenge = newChallenge
                }
            }
        }
        
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}
