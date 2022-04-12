//
//  ChallengeSelectionView.swift
//  EZPZ_ZZIN
//
//  Created by Hyunjae Lee on 2022/04/12.
//

import SwiftUI

struct ChallengeSelectionView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ChallengeEntity.timestamp, ascending: true)])
    private var items: FetchedResults<ChallengeEntity>
    @State private var sharedChallengeEntity: ChallengeEntity? = nil
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                HStack {
                    Text("작성할 도전을 선택해주세요!")
                        .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                        .foregroundColor(Color("ezpzLightgrey"))
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding(.top, 20)
                CustomDividerView()
                ForEach(items) { challengeEntity in
                    HStack {
                        Text("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
                            .font(.custom("SpoqaHanSansNeo-Bold",size: 18))
                            .foregroundColor(Color("ezpzLime"))
                            .padding(.leading, 15)
                            .padding([.top, .bottom], 6)
                        Spacer()
                    }
                    .onTapGesture {
                        sharedChallengeEntity = challengeEntity
                    }
                    CustomDividerView()
                }
                .sheet(item: $sharedChallengeEntity) {
                    EditorView(item: getTodaysJournalEntity(challengeEntity: $0))
                        .padding(.top, 20)
                }
            }
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
        let journalEntity: JournalEntity = JournalEntity(context: viewContext)
        journalEntity.toChallenge = challengeEntity
        journalEntity.date = Date()
        // TODO: 도전에 시작 날짜가 지정되어 있지 않을 때 예외 처리 다시 하기
        journalEntity.title = "\(getNthDay(startDate: challengeEntity.start ?? Date()))일차"
        journalEntity.text = "일지를 입력해 주세요"
        journalEntity.emoji = ""
        // try? viewContext.save()
        return journalEntity
    }

    func getNthDay(startDate: Date, currentDate: Date = Date()) -> Int {
        let difference: Double = startDate.distance(to: currentDate)
        let day: Int = Int(difference / (24 * 60 * 60))
        return day + 1
    }
}

struct ChallengeListView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeSelectionView()
    }
}
