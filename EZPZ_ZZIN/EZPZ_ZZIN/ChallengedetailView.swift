//
//  SwiftUIView.swift
//  ChallengeComplete
//
//  Created by 이주화 on 2022/04/08.
//

import SwiftUI

struct ChallengedetailView: View {
    @State var firstCheck = false
    @State var secondCheck = false
    @State var thirdCheck = false
    @State var fourthCheck = false
    @State var fifthCheck = false
    @State var sixthCheck = false
    @State var checkBool = false
    
    var body: some View {
        ZStack{
            ColorManage.ezpzBlack
                .ignoresSafeArea()
            ScrollView() {
            VStack{
                HStack{
                    Text("2022년 3월")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(ColorManage.ezpzLightgrey)
                }
                VStack{
                    Group{
                        HStack{
                    Text("🚴‍♀️ 100일 동안 5kg 빼기")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .multilineTextAlignment(.leading).padding([.leading], 17).padding(.bottom,2)
                            Spacer()
                        }
                        HStack{
                            Text("2022.03.12~2022.05.30")
                                .font(.system(size: 17))
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .padding(.leading, 17)
                                Spacer()
                        }.padding(.bottom, 10)
                    }
                    if (firstCheck){
                    Button(action: {
                        print("오늘 한 일 돌아보기")
                    }) {
                            Text("오늘 한 일 돌아보기")
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .frame(width: 356 , height: 40)
                                .foregroundColor(ColorManage.ezpzLime)
                                .background(ColorManage.ezpzDarkgrey)
                                .cornerRadius(10)
                    }
                    }
                }.padding([.top,.bottom], 20)

                VStack{
                    Group{
                        HStack{
                            Text("📍 오늘 할 일")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(ColorManage.ezpzLime)
                                .lineLimit(1).padding(.leading, 17.0)
                                .padding([.bottom], 5)
                                Spacer()
                                }
                        Divider()
                            .background(ColorManage.ezpzLightgrey)
                        ForEach(1..<7) { i in
                        CheckboxField(id: "사이클 30분 타기", label: "사이클 30분 타기", isMarked: $firstCheck).padding(.leading , 17).padding([.top, .bottom], 6)
                        Divider()
                            .background(ColorManage.ezpzSmokegrey)
                        }
                        HStack{
                        Text("+    할 일 추가하기")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(ColorManage.ezpzDarkgrey)
                                .multilineTextAlignment(.leading).padding([.leading], 20)
                            Spacer()
                        }
                        Divider()
                            .background(ColorManage.ezpzSmokegrey)
                    }

                }
                .padding(.bottom, 25)
                VStack{
                    Group{
                    HStack{
                        Text("🚴‍♀️ 12시 이후 방해금지 모드 설정하기")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(ColorManage.ezpzLime)
                            .lineLimit(1).padding(.leading, 17.0)
                            .padding([.top,.bottom], 5)
                            Spacer()
                            }
                    Divider()
                        .background(ColorManage.ezpzLightgrey)
                        ForEach(1..<7) { i in
                        CheckboxField(id: "사이클 30분 타기", label: "사이클 30분 타기", isMarked: $firstCheck).padding(.leading , 17).padding([.top, .bottom], 6)
                        Divider()
                            .background(ColorManage.ezpzSmokegrey)
                        }
                    HStack{
                        Text("+    할 일 추가하기")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(ColorManage.ezpzDarkgrey)
                                .multilineTextAlignment(.leading).padding([.leading], 20)
                            Spacer()
                        }
                        Divider()
                            .background(ColorManage.ezpzSmokegrey)
                    }
                }
                
                Spacer()
            }
            }
        }
    }
}

struct ChallengedetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengedetailView()
    }
}
