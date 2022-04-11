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
    
    func getJournals() -> [JournalEntity] {
        guard let set = challengeEntity.toJournal as? Set<JournalEntity> else {
            return []
        }
        return set.sorted {
            $0.date! < $1.date!
        }
    }
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    HStack {
                        Text("\(challengeEntity.start!, formatter: dateFormatter) ~ \(challengeEntity.end!, formatter: dateFormatter)")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    CustomDividerView()
                    HStack {
                        Spacer()
                        Text("최신순")
                            .font(.system(size: 16))
                        Image(systemName: "arrow.down")
                            .font(.system(size: 12))
                            .padding(.trailing, 15)
                    }
                    ForEach(getJournals()) { journalEntity in
                        NavigationLink(destination: EditorView(item: journalEntity)) {
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
