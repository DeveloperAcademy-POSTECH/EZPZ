//
//  NewTodoView.swift
//  EZPZ_ZZIN
//
//  Created by Hyunjae Lee on 2022/04/14.
//

import SwiftUI

struct NewTodoView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var challengeEntity: ChallengeEntity
    
    @State var mondayCheck = false
    @State var tuesdayCheck = false
    @State var wednesdayCheck = false
    @State var thursdayCheck = false
    @State var fridayCheck = false
    @State var saturdayCheck = false
    @State var sundayCheck = false
    
    @State private var todoTitle: String = ""
    
    private func bitmask() -> Int64 {
        var result: Int64 = 0
        if mondayCheck {
            result |= (1 << 0)
        }
        if tuesdayCheck {
            result |= (1 << 1)
        }
        if wednesdayCheck {
            result |= (1 << 2)
        }
        if thursdayCheck {
            result |= (1 << 3)
        }
        if fridayCheck {
            result |= (1 << 4)
        }
        if saturdayCheck {
            result |= (1 << 5)
        }
        if sundayCheck {
            result |= (1 << 6)
        }
        return result
    }
    
    private func createNewTodoEntity(){
        let todoEntity: TodoEntity = TodoEntity(context: viewContext)
        todoEntity.timestamp = Date()
        todoEntity.isChecked = false
        todoEntity.label = todoTitle
        todoEntity.mask = bitmask()
        todoEntity.toChallenge = challengeEntity
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                            .padding(.leading, 17.0)
                            .padding(.top, 20.0)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                    }
                    Spacer()
                    Button {
                        createNewTodoEntity()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                            .padding(.trailing, 17.0)
                            .padding(.top, 20.0)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                    }
                }
                .padding(.bottom, 20)
                HStack{
                    Text("할 일")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .padding(.leading, 17)
                    Spacer()
                }
                .padding(.bottom, 8)
                
                // 텍스트필드
                TextField("Create a to do.", text: $todoTitle)
                    .font(.custom("SpoqaHanSansNeo-Regular",size: 17))
                    .foregroundColor(ColorManage.ezpzLightgrey)
                    .padding(.leading, 17)
                
                Divider()
                    .padding(.horizontal, 17)
                    .padding(.bottom, 25)
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
                                Text("Not a repetitive a To do")
                                    .font(.custom("SpoqaHanSansNeo-Bikd",size: 17))
                                    .foregroundColor(ColorManage.ezpzLightgrey)
                                    .padding(.leading, 34)
                                Spacer()
                            }
                            HStack{
                                Text("Let them unselected.")
                                    .font(.custom("SpoqaHanSansNeo-Bikd",size: 17))
                                    .foregroundColor(ColorManage.ezpzLightgrey)
                                    .padding(.leading, 34)
                                Spacer()
                            }
                        }
                    }
                }.padding(.bottom, 40)
                Group{
                    HStack{
                        Text("Schedule")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                            .foregroundColor(ColorManage.ezpzLightgrey)
                            .padding(.leading, 17)
                        Spacer()
                    }.padding(.bottom, 0.1)
                    HStack{
                        Text("Select the days of the week to repeat")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
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
                                    Text("Mon")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                        .foregroundColor(ColorManage.ezpzLime)
                                }else {
                                    Text("Mon")
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
                                    Text("Tues")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                        .foregroundColor(ColorManage.ezpzLime)
                                }else {
                                    Text("Tues")
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
                                    Text("Wed")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                        .foregroundColor(ColorManage.ezpzLime)
                                }else {
                                    Text("Wed")
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
                                    Text("Thu")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                        .foregroundColor(ColorManage.ezpzLime)
                                }else {
                                    Text("Thu")
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
                            } else {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                            }
                            VStack{
                                if fridayCheck {
                                    Text("Fri")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                        .foregroundColor(ColorManage.ezpzLime)
                                } else {
                                    Text("Fri")
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
                            } else {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                            }
                            VStack{
                                if saturdayCheck {
                                    Text("Sat")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                        .foregroundColor(ColorManage.ezpzLime)
                                } else {
                                    Text("Sat")
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
                            } else {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(ColorManage.ezpzDeepgrey)
                                    .frame(width: 44, height: 62)
                            }
                            VStack{
                                if sundayCheck {
                                    Text("Sun")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                        .foregroundColor(ColorManage.ezpzLime)
                                } else {
                                    Text("Sun")
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
