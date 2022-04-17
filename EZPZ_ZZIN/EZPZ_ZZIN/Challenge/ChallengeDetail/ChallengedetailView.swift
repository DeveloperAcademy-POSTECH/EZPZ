//
//  SwiftUIView.swift
//  ChallengeComplete
//
//  Created by 이주화 on 2022/04/08.
//

import SwiftUI

struct ChallengedetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var checkBool = false
    @State private var showAlert = false
    @State private var isShowingNewTodoSheet = false
    @State private var flag: Int = 0
    @State private var isShowingJournalEditorView: Bool = false
    
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
    
    private func countCheckedTodaysTodo() -> Int {
        guard let set = challengeEntity.toTodo as? Set<TodoEntity> else {
            return 0
        }
        let sortedArray = set.sorted {
            $0.timestamp! < $1.timestamp!
        }
        var count: Int = 0
        let cal = Calendar(identifier: .gregorian)
        let now = Date()
        let comps = cal.dateComponents([.weekday], from: now)
        let position = (comps.weekday! + 5) % 7
        let mask: Int64 = Int64(1 << position)
        for todoEntity in sortedArray {
            if (todoEntity.mask & mask) != 0 && todoEntity.isChecked {
                count += 1
            }
        }
        return count
    }
    
    private func getJournals(challengeEntity: ChallengeEntity) -> [JournalEntity] {
        guard let set = challengeEntity.toJournal as? Set<JournalEntity> else {
            return []
        }
        return set.sorted {
            $0.date! < $1.date!
        }
    }

    private func getTodaysJournalEntity(challengeEntity: ChallengeEntity) -> JournalEntity {
        let journals = getJournals(challengeEntity: challengeEntity)
        if journals.isEmpty {
            return createNewJournalEntity(challengeEntity: challengeEntity)
        }
        let lastJournal: JournalEntity = journals[journals.count - 1]
        if getNthDay(startDate: challengeEntity.start ?? Date(), currentDate: lastJournal.date ?? Date()) == getNthDay(startDate: challengeEntity.start ?? Date()) {
            return lastJournal
        } else {
            return createNewJournalEntity(challengeEntity: challengeEntity)
        }
    }

    private func createNewJournalEntity(challengeEntity: ChallengeEntity) -> JournalEntity {
        
        // 랜덤으로 선택할 이모지들의 배열
        let randomEmoji: [String] = ["😀", "👍", "🐶", "🦊", "🍄", "🚀"]
        
        let journalEntity: JournalEntity = JournalEntity(context: viewContext)
        journalEntity.toChallenge = challengeEntity
        journalEntity.date = Date()
        journalEntity.title = "\(getNthDay(startDate: challengeEntity.start ?? Date()))일차"
        journalEntity.text = "Write a reflection"
        journalEntity.emoji = randomEmoji[Int.random(in: 0..<randomEmoji.count)]
        
        return journalEntity
    }

    private func getNthDay(startDate: Date, currentDate: Date = Date()) -> Int {
        let difference: Double = startDate.distance(to: currentDate)
        let day: Int = Int(difference / (24 * 60 * 60))
        return day + 1
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
                        
                        if flag >= 0 && countCheckedTodaysTodo() > 0 {
                            Button(action: {
                                print("Reflect on today")
                                isShowingJournalEditorView = true
                            }) {
                                Text("Reflect on today")
                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                                    .frame(width: 356 , height: 40)
                                    .foregroundColor(ColorManage.ezpzLime)
                                    .background(ColorManage.ezpzDarkgrey)
                                    .cornerRadius(10)
                            }
                            .sheet(isPresented: $isShowingJournalEditorView) {
                                let journalEntity: JournalEntity = getTodaysJournalEntity(challengeEntity: challengeEntity)
                                EditorView(item: journalEntity, text: journalEntity.text ?? "Write a reflection")
                                    .padding(.top, 20)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    if flag >= 0 {
                        // BEGIN 오늘 할 일
                        
                        VStack{
                            Group{
                                HStack{
                                    Text("📍  Today’s todo")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                        .foregroundColor(ColorManage.ezpzLime)
                                        .lineLimit(1).padding(.leading, 17.0)
                                        .padding([.bottom], 5)
                                    Spacer()
                                }
                                Divider()
                                    .background(ColorManage.ezpzLightgrey)
                                ForEach(getTodo(forToday: true)) { todoEntity in
                                    CheckboxField1(todoEntity: todoEntity, flag: $flag)
                                        .padding(.leading , 17)
                                        .padding([.top, .bottom], 6)
                                    Divider()
                                        .background(ColorManage.ezpzSmokegrey)
                                }
                                HStack{
                                    Text("+    Add to do")
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
                                    Text("🗓  To do later")
                                        .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                        .foregroundColor(ColorManage.ezpzLime)
                                        .lineLimit(1).padding(.leading, 17.0)
                                        .padding([.top,.bottom], 5)
                                    Spacer()
                                }
                                Divider()
                                    .background(ColorManage.ezpzLightgrey)
                                ForEach(getTodo(forToday: false)) { todoEntity in
                                    CheckboxField1(todoEntity: todoEntity, flag: $flag)
                                        .padding(.leading , 17)
                                        .padding([.top, .bottom], 6)
                                    Divider()
                                        .background(ColorManage.ezpzSmokegrey)
                                }
                                HStack{
                                    Text("+    Add to do")
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
        }
        .sheet(isPresented: $isShowingNewTodoSheet) {
            NewTodoView(challengeEntity: challengeEntity)
        }
        .navigationTitle("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
    }
}

struct CheckboxField1: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var todoEntity: TodoEntity
    @Binding var flag: Int
    let size: CGFloat = 15
    let color: Color = Color("ezpzPink")
    let textSize: Int = 17
    
    @State private var showingActionSheet = false
    @State private var showAlert = false
    @State private var isShowingTodoEditView: Bool = false
    
    var body: some View {
        Button(action:{
            todoEntity.isChecked.toggle()
            flag ^= 1
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
                    "Can change the challenge title and period!",
                    isPresented: $showingActionSheet,
                    actions: {
                        Button("Edit To-do") {
                            isShowingTodoEditView = true
                        }
                        Button("Delete To-do", role: .destructive ) {
                            showAlert = true
                        }
                        Button("Cancel", role: .cancel) { }
                    })
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Are you sure you want to erase the task??"), message: Text("You can’t revert it..."), primaryButton: .destructive(Text("Delete"), action: {
                        
                        // Action
                        viewContext.delete(todoEntity)
                        do {
                            try viewContext.save()
                        } catch {
                            print(error)
                        }
                        
                    } ), secondaryButton: .cancel(Text("Back")))
                }
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
        .sheet(isPresented: $isShowingTodoEditView) {
            TodoeditView(todoEntity: todoEntity, label: todoEntity.label ?? "", mask: todoEntity.mask, flag: $flag)
        }
    }
    
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter
}()
