//
//  SwiftUIView.swift
//  ChallengeComplete
//
//  Created by 이주화 on 2022/04/08.
//

import SwiftUI

struct ChallengedetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var isShowingReviewButton: Bool = false
    
    @State var checkBool = false
    @State private var showAlert = false
    @State private var isShowingNewTodoSheet = false
    
    @ObservedObject var challengeEntity: ChallengeEntity
    
    private func getTodo(forToday: Bool) -> [TodoEntity] {
        guard let set = challengeEntity.toTodo as? Set<TodoEntity> else {
            return []
        }
        let sortedArray = set.sorted {
            $0.timestamp! < $1.timestamp!
        }
        var result = [TodoEntity]()
        let cal = Calendar(identifier: .gregorian)
        let now = Date()
        let comps = cal.dateComponents([.weekday], from: now)
        let position = (comps.weekday! + 5) % 7
        let mask: Int64 = Int64(1 << position)
        for todoEntity in sortedArray {
            if forToday {
                if (todoEntity.mask & mask) != 0 {
                    result.append(todoEntity)
                }
            } else {
                if (todoEntity.mask & mask) == 0 {
                    result.append(todoEntity)
                }
            }
        }
        return result
    }
    
    var body: some View {
        ZStack{
            ColorManage.ezpzBlack
                .ignoresSafeArea()
            ScrollView() {
                VStack{
                    VStack{
                        HStack {
                            Text("\(challengeEntity.start ?? Date(), formatter: dateFormatter) ~ \(challengeEntity.end ?? Date(), formatter: dateFormatter)")
                                .font(.custom("SpoqaHanSansNeo-Regular",size: 18))
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .fontWeight(.medium)
                                .padding(.leading, 20)
                            Spacer()
                        }
                        
                        if (isShowingReviewButton){
                            Button(action: {
                                print("오늘 한 일 돌아보기")
                            }) {
                                Text("오늘 한 일 돌아보기")
                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                                    .frame(width: 356 , height: 40)
                                    .foregroundColor(ColorManage.ezpzLime)
                                    .background(ColorManage.ezpzDarkgrey)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // BEGIN 오늘 할 일
                    
                    VStack{
                        Group{
                            HStack{
                                Text("📍  오늘 할 일")
                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                    .foregroundColor(ColorManage.ezpzLime)
                                    .lineLimit(1).padding(.leading, 17.0)
                                    .padding([.bottom], 5)
                                Spacer()
                            }
                            Divider()
                                .background(ColorManage.ezpzLightgrey)
                            ForEach(getTodo(forToday: true)) { todoEntity in
                                CheckboxField1(todoEntity: todoEntity)
                                    .padding(.leading , 17)
                                    .padding([.top, .bottom], 6)
                                Divider()
                                    .background(ColorManage.ezpzSmokegrey)
                            }
                            HStack{
                                Text("+    할 일 추가하기")
                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                                    .foregroundColor(ColorManage.ezpzSmokegrey)
                                    .multilineTextAlignment(.leading).padding([.leading], 20)
                                Spacer()
                            }
                            .onTapGesture {
                                isShowingNewTodoSheet = true
                            }
                            Divider()
                                .background(ColorManage.ezpzSmokegrey)
                        }
                        
                    }
                    .padding(.bottom, 25)
                    
                    // END 오늘 할일
                    
                    // BEGIN 나중에 할 일
                    
                    VStack{
                        Group{
                            HStack{
                                Text("🗓  나중에 할 일")
                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                    .foregroundColor(ColorManage.ezpzLime)
                                    .lineLimit(1).padding(.leading, 17.0)
                                    .padding([.top,.bottom], 5)
                                Spacer()
                            }
                            Divider()
                                .background(ColorManage.ezpzLightgrey)
                            ForEach(getTodo(forToday: false)) { todoEntity in
                                CheckboxField1(todoEntity: todoEntity)
                                    .padding(.leading , 17)
                                    .padding([.top, .bottom], 6)
                                Divider()
                                    .background(ColorManage.ezpzSmokegrey)
                            }
                            HStack{
                                Text("+    할 일 추가하기")
                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                                    .foregroundColor(ColorManage.ezpzSmokegrey)
                                    .multilineTextAlignment(.leading).padding([.leading], 20)
                                Spacer()
                            }
                            .onTapGesture {
                                isShowingNewTodoSheet = true
                            }
                            Divider()
                                .background(ColorManage.ezpzSmokegrey)
                        }
                    }
                    
                    // END 나중에 할일
                }
            }
        }
        .sheet(isPresented: $isShowingNewTodoSheet) {
            NewTodoView(challengeEntity: challengeEntity)
        }
        .navigationTitle("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
    }
}

struct CheckboxField1: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let size: CGFloat
    let color: Color
    let textSize: Int
    
    @State private var showingActionSheet = false
    @State private var showAlert = false
    @State private var isShowingTodoEditView: Bool = false
    @ObservedObject var todoEntity: TodoEntity
    
    init(todoEntity: TodoEntity, size: CGFloat = 15, color: Color = ColorManage.ezpzPink, textSize: Int = 17) {
        self.todoEntity = todoEntity
        self.size = size
        self.color = color
        self.textSize = textSize
    }
    
    var body: some View {
        Button(action:{
            todoEntity.isChecked.toggle()
            try? viewContext.save()
        }) {
            HStack(alignment: .center, spacing: 10) {
                if (todoEntity.isChecked) {
                    Image(systemName: "checkmark.square")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                } else {
                    Image(systemName: "square")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
                if (todoEntity.isChecked){
                    Text(todoEntity.label ?? "")
                        .font(.custom("SpoqaHanSansNeo-Regular",size: size))
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .strikethrough()
                } else{
                    Text(todoEntity.label ?? "")
                        .font(.custom("SpoqaHanSansNeo-Regular",size: size))
                        .foregroundColor(ColorManage.ezpzLightgrey)
                }
                Spacer()
                Button(action: {self.showingActionSheet.toggle()}) {
                    Image(systemName: "ellipsis")
                        .padding(.trailing, 17.0)
                        .foregroundColor(ColorManage.ezpzPink)
                }
                .confirmationDialog(
                    "도전명 변경 및 도전 기간을 수정할 수 있어요!",
                    isPresented: $showingActionSheet,
                    actions: {
                        Button("할 일 수정하기") {
                            isShowingTodoEditView = true
                        }
                        Button("할 일 삭제하기", role: .destructive ) {
                            showAlert = true
                        }
                        Button("Cancel", role: .cancel) { }
                    })
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("할 일을 삭제하시겠어요?"), message: Text("한 번 지운 할 일은 복구할 수 없어요..."), primaryButton: .destructive(Text("삭제하기"), action: {
                        
                        // Action
                        viewContext.delete(todoEntity)
                        do {
                            try viewContext.save()
                        } catch {
                            print(error)
                        }
                        
                    } ), secondaryButton: .cancel(Text("돌아가기")))
                }
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
        .sheet(isPresented: $isShowingTodoEditView) {
            TodoeditView(todoEntity: todoEntity, label: todoEntity.label ?? "", mask: todoEntity.mask)
        }
    }
    
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter
}()
