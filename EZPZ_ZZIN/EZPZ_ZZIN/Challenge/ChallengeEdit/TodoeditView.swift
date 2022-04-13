//
//  TodoeditView.swift
//  EZPZ_ZZIN
//
//  Created by 이주화 on 2022/04/14.
//

import SwiftUI

struct TodoeditView: View {
    @State var mondayCheck = false
    @State var tuesdayCheck = false
    @State var wednesdayCheck = false
    @State var thursdayCheck = false
    @State var fridayCheck = false
    @State var saturdayCheck = false
    @State var sundayCheck = false
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Spacer()
                        Image(systemName: "checkmark")
                            .padding(.trailing, 30.0)
                            .padding(.top, 20.0)
                            .foregroundColor(ColorManage.ezpzDisable)
                }
                HStack{
                    Text("할 일")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .padding(.leading, 17)
                        Spacer()
                }
                .padding(.bottom, 8)
                HStack{
                    Text("추가할 할 일을 적어주세요.")
                        .font(.custom("SpoqaHanSansNeo-Regular",size: 17))
                        .foregroundColor(ColorManage.ezpzDisable)
                        .padding(.leading, 17)
                        Spacer()
                }
                Divider()
                    .padding([.leading, .trailing], 17)
                ZStack{
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(ColorManage.ezpzDeepgrey)
                        .frame(width: 356, height: 107)
                    VStack{
                        Group{
                        HStack{
                            Text("Notice")
                                .font(.custom("SpoqaHanSansNeo-Bold",size: 24))
                                .foregroundColor(ColorManage.ezpzPink)
                                .padding(.leading, 34)
                            Spacer()
                        }.padding(.bottom, 3)
                        HStack{
                            Text("반복적으로 할 일이 아니라면")
                                .font(.custom("SpoqaHanSansNeo-Bikd",size: 17))
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .padding(.leading, 34)
                            Spacer()
                        }
                        HStack{
                            Text("누르지 않은 상태로 저장해주세요.")
                                .font(.custom("SpoqaHanSansNeo-Bikd",size: 17))
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .padding(.leading, 34)
                            Spacer()
                        }
                    }
                    }
                }.padding(.bottom, 20)
                Group{
                HStack{
                    Text("일정")
                        .font(.custom("SpoqaHanSansNeo-Bikd",size: 17))
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .padding(.leading, 17)
                        Spacer()
                }.padding(.bottom, 0.1)
                HStack{
                    Text("반복할 요일을 정해주세요")
                        .font(.custom("SpoqaHanSansNeo-Bikd",size: 17))
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .padding(.leading, 17)
                        Spacer()
                }.padding(.bottom, 5)
                }
                HStack{
                    
                    Button(action: {
                        mondayCheck.toggle()
                    }) {
                            ZStack{
                                if mondayCheck {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(Color.black)
                                    .frame(width: 44, height: 62)
                                }else {
                                    RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                                }
                                    VStack{
                                        if mondayCheck {
                                        Text("월")
                                            .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzLime)
                                        }else {
                                            Text("월")
                                                .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzDisable)
                                            
                                        }
                                    }
                    }
                    }
                    Button(action: {
                        tuesdayCheck.toggle()
                    }) {
                            ZStack{
                                if tuesdayCheck {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(Color.black)
                                    .frame(width: 44, height: 62)
                                }else {
                                    RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                                }
                                    VStack{
                                        if tuesdayCheck {
                                        Text("화")
                                            .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzLime)
                                        }else {
                                            Text("화")
                                                .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzDisable)
                                            
                                        }
                                    }
                    }
                    }
                    Button(action: {
                        wednesdayCheck.toggle()
                    }) {
                            ZStack{
                                if wednesdayCheck {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(Color.black)
                                    .frame(width: 44, height: 62)
                                }else {
                                    RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                                }
                                    VStack{
                                        if wednesdayCheck {
                                        Text("수")
                                            .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzLime)
                                        }else {
                                            Text("수")
                                                .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzDisable)
                                            
                                        }
                                    }
                    }
                    }
                    Button(action: {
                        thursdayCheck.toggle()
                    }) {
                            ZStack{
                                if thursdayCheck {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(Color.black)
                                    .frame(width: 44, height: 62)
                                }else {
                                    RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                                }
                                    VStack{
                                        if thursdayCheck {
                                        Text("목")
                                            .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzLime)
                                        }else {
                                            Text("목")
                                                .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzDisable)
                                            
                                        }
                                    }
                    }
                    }
                    Button(action: {
                        fridayCheck.toggle()
                    }) {
                            ZStack{
                                if fridayCheck {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(Color.black)
                                    .frame(width: 44, height: 62)
                                }else {
                                    RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                                }
                                    VStack{
                                        if fridayCheck {
                                        Text("금")
                                            .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzLime)
                                        }else {
                                            Text("금")
                                                .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzDisable)
                                            
                                        }
                                    }
                    }
                    }
                    Button(action: {
                        saturdayCheck.toggle()
                    }) {
                            ZStack{
                                if saturdayCheck {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(Color.black)
                                    .frame(width: 44, height: 62)
                                }else {
                                    RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                                }
                                    VStack{
                                        if saturdayCheck {
                                        Text("토")
                                            .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzLime)
                                        }else {
                                            Text("토")
                                                .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzDisable)
                                            
                                        }
                                    }
                    }
                    }
                    Button(action: {
                        sundayCheck.toggle()
                    }) {
                            ZStack{
                                if sundayCheck {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(Color.black)
                                    .frame(width: 44, height: 62)
                                }else {
                                    RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                                }
                                    VStack{
                                        if sundayCheck {
                                        Text("일")
                                            .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzLime)
                                        }else {
                                            Text("일")
                                                .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                            .foregroundColor(ColorManage.ezpzDisable)
                                            
                                        }
                                    }
                    }
                    }
                    
                    
                }
                Spacer()

            }
        }
    }
}

struct TodoeditView_Previews: PreviewProvider {
    static var previews: some View {
        TodoeditView()
    }
}
