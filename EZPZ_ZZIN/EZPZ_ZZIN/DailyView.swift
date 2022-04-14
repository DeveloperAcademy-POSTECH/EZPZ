//
//  DailyView.swift
//  Journal
//
//  Created by Hyunjae on 4/7/22.
//

import SwiftUI

struct DailyView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var challengeEntity: ChallengeEntity
    @State var isNewestFirst: Bool = true
    
    func getJournals() -> [JournalEntity] {
        guard let set = challengeEntity.toJournal as? Set<JournalEntity> else {
            return []
        }
        let sortedArray = set.sorted {
            $0.date! < $1.date!
        }
        if isNewestFirst {
            return sortedArray
        } else {
            return sortedArray.reversed()
        }
    }
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    HStack {
                        Text("\(challengeEntity.start ?? Date(), formatter: dateFormatter) ~ \(challengeEntity.end ?? Date(), formatter: dateFormatter)")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    CustomDividerView()
                    if isNewestFirst {
                        HStack {
                            Spacer()
                            Text("최신순")
                                .font(.system(size: 16))
                            Image(systemName: "arrow.down")
                                .font(.system(size: 12))
                                .padding(.trailing, 15)
                        }
                        .onTapGesture {
                            isNewestFirst.toggle()
                        }
                    } else {
                        HStack {
                            Spacer()
                            Text("오래된순")
                                .font(.system(size: 16))
                            Image(systemName: "arrow.up")
                                .font(.system(size: 12))
                                .padding(.trailing, 15)
                        }
                        .onTapGesture {
                            isNewestFirst.toggle()
                        }
                    }
                    ForEach(getJournals()) { journalEntity in
                        NavigationLink(destination: EditorView(item: journalEntity, text: journalEntity.text ?? "일지를 입력해 주세요")) {
                            CardView(journalEntity: journalEntity)
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }
        }
        .navigationTitle("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter
}()
