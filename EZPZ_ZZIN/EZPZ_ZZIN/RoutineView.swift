//
//  ContentView.swift
//  main
//
//  Created by 이주화 on 2022/04/06.
//

import SwiftUI

struct RoutineView: View {
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
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                        .foregroundColor(ColorManage.ezpzLightgrey)
                }.frame(height: 45)
                HStack{
                    ScrollView(.horizontal) {
                        HStack {
                                ForEach(1..<30) { i in
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .fill(ColorManage.ezpzDeepgrey)
                                            .frame(width: 50, height: 70)
                                            VStack{
                                                Text("월")
                                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                                .foregroundColor(ColorManage.ezpzDisdable)
                                                .padding(.bottom, 4).padding(.top,3)
                                                Text("\(i)")
                                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                                        .foregroundColor(ColorManage.ezpzDisdable)
                                                }
                                                }
                                                    .foregroundColor(ColorManage.ezpzLightgrey)
                                            }
                            }
                    }
                }
                VStack{
                    Group{
                        HStack{
                    Text("오늘 할 일")
                                .font(.custom("SpoqaHanSansNeo-Bold",size: 28))
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .multilineTextAlignment(.leading).padding([.leading], 17).padding(.bottom, 0.1)
                            Spacer()
                        }
                        HStack{
                            Text("오늘 할 일이 3개 있어요!")
                                .font(.custom("SpoqaHanSansNeo-Regular",size: 17))
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .padding(.leading, 17)
                                Spacer()
                        }
                    }
                    
                    if (firstCheck) {
                    Button(action: {
                        print("오늘 한 일 돌아보기")
                        
                    }) {
                            Text("오늘 한 일 돌아보기")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                .frame(width: 356 , height: 40)
                                .foregroundColor(ColorManage.ezpzLime)
                                .background(ColorManage.ezpzDeepgrey)
                                .cornerRadius(10)
                    }
                    }
                }.padding([.top,.bottom], 20)
                VStack{
                    Group{
                        HStack{
                            Text("🚴‍♀️ 100일 동안 5kg 빼기")
                                .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                .foregroundColor(ColorManage.ezpzLime)
                                .lineLimit(1).padding(.leading, 17.0)
                                .padding(.top, 5).padding(.bottom, 1)
                                Spacer()
                                }
                        Divider()
                        .background(ColorManage.ezpzLightgrey)
                        ForEach(1..<4) { i in
                        CheckboxField(id: "사이클 30분 타기", label: "사이클 30분 타기", isMarked: $firstCheck).padding(.leading , 17).padding([.top, .bottom], 6)
                        Divider()
                            .background(ColorManage.ezpzSmokegrey)

                        }
                    }
                }
                .padding(.bottom, 40)
                VStack{
                    Group{
                    HStack{
                        Text("⏰ 12시 이후 방해금지 모드 설정하기")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                            .foregroundColor(ColorManage.ezpzLime)
                            .lineLimit(1).padding(.leading, 17.0)
                            .padding(.top, 5).padding(.bottom, 1)
                            .lineLimit(1)
                        Spacer()
                    }.padding(.leading, 17)
                    Divider()
                        .background(ColorManage.ezpzLightgrey)
                    ForEach(1..<8) { i in
                        CheckboxField(id: "사이클 30분 타기", label: "사이클 30분 타기", isMarked: $secondCheck).padding(.leading , 17).padding([.top, .bottom], 6)
                        Divider()
                            .background(ColorManage.ezpzSmokegrey)

                        }                    }
                }
                
                Spacer()
            }
            }
        }
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView()
    }
}

struct CheckboxField: View {
    let id: String       //변수 타입 선언
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int

    @Binding var isMarked: Bool
    
    init(
    id: String,
    label:String,
    size: CGFloat = 15,
    color: Color = ColorManage.ezpzPink,
    textSize: Int = 17,
    isMarked: Binding<Bool>
    ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self._isMarked = isMarked
    }
    
    
    var body: some View {
        Button(action:{
            isMarked.toggle()
        }) {
            HStack(alignment: .center, spacing: 10) {
                if (isMarked){
                Image(systemName: "checkmark.square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                } else{
                    Image(systemName: "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                }
                if (self.isMarked){
                    Text(label)
                        .font(.custom("SpoqaHanSansNeo-Regular",size: size))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                    .strikethrough()
                } else{
                    Text(label)
                        .font(.custom("SpoqaHanSansNeo-Regular",size: size))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                }
                Spacer()
            }.foregroundColor(self.color)
            
        }
        .foregroundColor(Color.white)
    }
    
}
    struct RoundedRectangleview: View {
        @State var label: String
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: /*@PLACEHOLDER=Corner Radius@*/10.0)
                    .fill(ColorManage.ezpzDeepgrey)
                    .frame(width: 52, height: 80)
                VStack{
                Text("월")
                        .font(.system(size: 12))
                        .padding(.bottom, 10)
                Text(label)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
            }
        }
    }




