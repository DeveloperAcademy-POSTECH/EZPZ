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
    @State var monthState = 3
    @State var array: [Bool] = Array(repeating: false, count: 30)
    @State var dayState = [5, 1, 1, 4, 6, 2, 4, 0, 3, 5, 1, 3]
    @State var dayArray = ["월", "화", "수", "목", "금", "토", "일", "월", "화", "수", "목", "금", "토", "일", "월", "화", "수", "목", "금", "토", "일", "월", "화", "수", "목", "금", "토", "일", "월", "화", "수", "목", "금", "토", "일", "월", "화", "수", "목", "금", "토", "일"]
    @State var monthArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    @State var isPresented: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ChallengeEntity.timestamp, ascending: true)])
    private var items: FetchedResults<ChallengeEntity>
    @State private var sharedChallengeEntity: ChallengeEntity? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.timestamp, ascending: true)])
    private var todoEntityFetchedResults: FetchedResults<TodoEntity>
    
    private func countTodaysTodos() -> Int {
        var count: Int = 0
        let cal = Calendar(identifier: .gregorian)
        let now = Date()
        let comps = cal.dateComponents([.weekday], from: now)
        let position = (comps.weekday! + 5) % 7
        let mask: Int64 = Int64(1 << position)
        for todoEntity in todoEntityFetchedResults {
            if (todoEntity.mask & mask) != 0 {
                count += 1
            }
        }
        return count
    }
    
    private func countTodaysChekcedTodos() -> Int {
        var count: Int = 0
        let cal = Calendar(identifier: .gregorian)
        let now = Date()
        let comps = cal.dateComponents([.weekday], from: now)
        let position = (comps.weekday! + 5) % 7
        let mask: Int64 = Int64(1 << position)
        for todoEntity in todoEntityFetchedResults {
            if (todoEntity.mask & mask) != 0 && todoEntity.isChecked {
                count += 1
            }
        }
        return count
    }
    
    private func getTodaysTodo(challengeEntity: ChallengeEntity) -> [TodoEntity] {
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
            if (todoEntity.mask & mask) != 0 {
                result.append(todoEntity)
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
                    HStack{
                        Button(action: {
                            monthState = monthState - 1
                        }) {
                            Image(systemName: "chevron.backward")
                                .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                                .padding(.leading, 17.0)
                                .foregroundColor(ColorManage.ezpzLightgrey)
                        }
                        Spacer()
                        Text("2022년 \(monthArray[monthState])월")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                            .foregroundColor(ColorManage.ezpzLightgrey)
                        Spacer()
                        Button(action: {
                            monthState = monthState + 1
                        }) {
                            Image(systemName: "chevron.forward")
                                .font(.custom("SpoqaHanSansNeo-Bold",size: 17))
                                .padding(.trailing, 17.0)
                                .foregroundColor(ColorManage.ezpzLightgrey)
                        }
                    }.frame(height: 45)
                }
                HStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(0..<30) { i in
                                Button(action: {
                                    array = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
                                    array[i].toggle()
                                }) {
                                    ZStack{
                                        if array[i]{
                                            RoundedRectangle(cornerRadius: 10.0)
                                                .fill(Color.black)
                                                .frame(width: 50, height: 70)
                                        }else{
                                            RoundedRectangle(cornerRadius: 10.0)
                                                .fill(ColorManage.ezpzDeepgrey)
                                                .frame(width: 50, height: 70)
                                        }
                                        VStack{
                                            if array[i]{
                                                Text("\(dayArray[i+dayState[monthState]])")
                                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                                    .foregroundColor(ColorManage.ezpzPink)
                                                    .padding(.bottom, 4).padding(.top,3)
                                            }else{
                                                Text("\(dayArray[i+dayState[monthState]])")
                                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 13))
                                                    .foregroundColor(ColorManage.ezpzDisable)
                                                    .padding(.bottom, 4).padding(.top,3)
                                            }
                                            if array[i]{
                                                Text("\(i+1)")
                                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                                    .foregroundColor(ColorManage.ezpzPink)
                                            }else{
                                                Text("\(i+1)")
                                                    .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                                    .foregroundColor(ColorManage.ezpzDisable)
                                            }
                                        }
                                    }
                                    .foregroundColor(ColorManage.ezpzLightgrey)
                                }
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
                            Text("오늘 할 일이 \(countTodaysTodos() - countTodaysChekcedTodos())개 있어요!")
                                .font(.custom("SpoqaHanSansNeo-Regular",size: 17))
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .padding(.leading, 17)
                            Spacer()
                        }
                    }
                    
                    if (countTodaysChekcedTodos() > 0) {
                        Button(action: {
                            print("오늘 한 일 돌아보기")
                            isPresented = true
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
                
                ForEach(items) { challengeEntity in
                    VStack{
                        HStack{
                            Text("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
                                .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                                .foregroundColor(ColorManage.ezpzLime)
                                .lineLimit(1).padding(.leading, 17.0)
                                .padding(.top, 5).padding(.bottom, 1)
                            Spacer()
                        }
                        Divider()
                            .background(ColorManage.ezpzLightgrey)
                        ForEach(getTodaysTodo(challengeEntity: challengeEntity)) { todoEntity in
                            CheckboxField(todoEntity: todoEntity)
                                .padding(.leading , 17)
                                .padding([.top, .bottom], 6)
                            Divider()
                                .background(ColorManage.ezpzSmokegrey)
                            
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            ChallengeSelectionView()
        }
    }
    func getJournals(challengeEntity: ChallengeEntity) -> [JournalEntity] {
        guard let set = challengeEntity.toJournal as? Set<JournalEntity> else {
            return []
        }
        return set.sorted {
            $0.date! < $1.date!
        }
    }
    
    func getTodaysJournalEntity(challengeEntity: ChallengeEntity) -> JournalEntity {
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
    
    func createNewJournalEntity(challengeEntity: ChallengeEntity) -> JournalEntity {
        
        // 랜덤으로 선택할 이모지들의 배열
        let randomEmoji: [String] = ["😀", "👍", "🐶", "🦊", "🍄", "🚀"]
        
        let journalEntity: JournalEntity = JournalEntity(context: viewContext)
        journalEntity.toChallenge = challengeEntity
        journalEntity.date = Date()
        journalEntity.title = "\(getNthDay(startDate: challengeEntity.start ?? Date()))일차"
        journalEntity.text = "일지를 입력해 주세요"
        journalEntity.emoji = randomEmoji[Int.random(in: 0..<randomEmoji.count)]
        
        return journalEntity
    }
    
    func getNthDay(startDate: Date, currentDate: Date = Date()) -> Int {
        let difference: Double = startDate.distance(to: currentDate)
        let day: Int = Int(difference / (24 * 60 * 60))
        return day + 1
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView()
    }
}

struct CheckboxField: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var todoEntity: TodoEntity
    
    var size: CGFloat = 15
    var color: Color = Color("ezpzPink")
    var textSize: Int = 17
    
    var body: some View {
        Button(action:{
            todoEntity.isChecked.toggle()
            try? viewContext.save()
        }) {
            HStack(alignment: .center, spacing: 10) {
                if (todoEntity.isChecked){
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
