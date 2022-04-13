//
//  MyPageMainView.swift
//  EZPZ
//
//  Created by 최홍준 on 2022/04/08.
//

import SwiftUI

struct MyPageMainView: View {
    
    // CoreData 관련 코드
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \UserEntity.timestamp, ascending: true)])
    private var user: FetchedResults<UserEntity>
    
    @State private var showingActionSheet = false
    @State private var showingAlert = false
    @State private var isPresented1: Bool = false
    @State private var isPresented2: Bool = false
    @State private var isShowingPhotoPicker: Bool = false
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ChallengeEntity.timestamp, ascending: true)])
    private var items: FetchedResults<ChallengeEntity>
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var sharedChallengeEntity: ChallengeEntity? = nil
    
    // 이 함수로 전달한 ChallengeEntity를 삭제한다.
    private func deleteChallengeEntity(challengeEntity: ChallengeEntity) {
        do {
            viewContext.delete(challengeEntity)
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    private func loadProfileImage() -> UIImage {
        let defaultImage: UIImage = UIImage(named: "ezpz")!
        if user.isEmpty {
            print("사용자가 등록되어있지 않음")
            return defaultImage
        }
        guard let fileName = user[0].image else {
            return defaultImage
        }
        let document = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = document.appendingPathComponent(fileName)
        var result: UIImage = defaultImage
        do {
            let data = try Data(contentsOf: url)
            result = UIImage(data: data)!
        } catch {
            print(error)
        }
        return result
    }
    
    func removeImage(imageString: String) {
        let document = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = document.appendingPathComponent(imageString)
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            print(error)
        }
    }
    
    private func removeProfileImage() {
        if user.isEmpty {
            print("사용자가 등록되어있지 않음")
            return
        }
        guard let fileName: String = user[0].image else {
            return
        }
        removeImage(imageString: fileName)
        user[0].image = nil
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    func getUsername() -> String {
        
        // 유저 이름이 설정되지 않았을 때의 기본 값
        let defaultUsername: String = "린다"
        
        if user.isEmpty {
            return defaultUsername
        } else {
            return user[0].name ?? defaultUsername
        }
    }
    
    var body: some View {
        ZStack {
            ColorManage.ezpzBlack.ignoresSafeArea()
            VStack {
                HStack {
                    Text("마이페이지")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .multilineTextAlignment(.leading).padding(.leading, 17.0)
                    Spacer()
                }
                .padding(.bottom, 20.0)
                HStack {
                    Text("프로필")
                        .font(.system( size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .padding(.leading, 17.0)
                    Spacer()
                    Button(action: {self.showingActionSheet.toggle()}) {
                        Image(systemName: "gearshape")
                            .padding(.trailing, 17.0)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                    }
                    .confirmationDialog(
                        "Select",
                        isPresented: $showingActionSheet,
                        actions: {
                            Button("닉네임 변경하기") {
                                self.isPresented1 = true
                            }
                            Button("프로필 이미지 변경하기") {
                                isShowingPhotoPicker = true
                            }
                            Button("프로필 이미지 삭제하기", role: .destructive) {
                                removeProfileImage()
                            }
                            Button("Cancel", role: .cancel) { }
                        })
                    .sheet(isPresented: $isPresented1) {
                        ChangeNameView(user: user[0], username: getUsername())
                    }
                    .sheet(isPresented: $isShowingPhotoPicker) {
                        ProfileImagePicker(user: user[0])
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(ColorManage.ezpzDarkgrey)
                        .frame(width: 356, height: 110)
                    HStack {
                        // 프로필 이미지
                        Image(uiImage: loadProfileImage())
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding(.leading, 37.0)
                        
                        Text(getUsername())
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(ColorManage.ezpzLime)
                            .padding(.leading, 10.0)
                        Spacer()
                    }
                }
                .padding(.bottom, 40.0)
                HStack {
                    Text("설정")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(ColorManage.ezpzLightgrey)
                        .padding(.leading, 17.0)
                        .padding([.top,.bottom], 5)
                    Spacer()
                }
                Divider()
                    .background(ColorManage.ezpzSmokegrey)
                Group {
                    HStack {
                        Text("앱 버전 정보")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                            .padding(.leading, 17.0)
                            .padding([.top,.bottom], 5)
                        Spacer()
                        Text("v0.01.0")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(ColorManage.ezpzLime)
                            .padding(.trailing, 17.0)
                            .padding([.top,.bottom], 5)
                    }
                    Divider()
                        .background(ColorManage.ezpzSmokegrey)
                    HStack {
                        Button(action: {
                            // some action
                        }) {Text("푸시 알람 설정")
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .padding(.leading, 17.0)
                                .padding([.top,.bottom], 5)
                        }
                        Spacer()
                    }
                    Divider()
                        .background(ColorManage.ezpzSmokegrey)
                    HStack {
                        Button(action: {
                            // some action
                        }) {
                            Text("라이센스 정보")
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .padding(.leading, 17.0)
                                .padding([.top,.bottom], 5)
                        }
                        Spacer()
                    }
                    Divider()
                        .background(ColorManage.ezpzSmokegrey)
                    HStack {
                        Link(destination: URL(string: "https://frosted-zone-8df.notion.site/EZPZ-8187af3a5f8f4d41b0935eb2c230e87a")!, label: {
                            Text("이용 약관")
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                .foregroundColor(ColorManage.ezpzLightgrey)
                                .padding(.leading, 17.0)
                                .padding([.top,.bottom], 5)
                        })
                        Spacer()
                    }
                    Divider()
                        .background(ColorManage.ezpzSmokegrey)
                }
                Divider()
                    .background(ColorManage.ezpzSmokegrey)
                HStack {
                    Button(action: {isPresented2 = true}) {
                        Text("도전 포기하기")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                            .opacity(0.5)
                            .padding(.leading, 17.0)
                            .padding([.top,.bottom], 5)
                    }
                    Spacer()
                        .sheetResize(
                            isPresented: $isPresented2,
                            detents: [.medium(),.large()]
                        ) {
                        } content: {
                            ZStack {
                                Color("ezpzBlack")
                                    .edgesIgnoringSafeArea(.all)
                                VStack {
                                    
                                    ScrollView {
                                        HStack {
                                            Text("포기할 도전을 선택해주세요!")
                                                .font(.system(size: 18))
                                                .foregroundColor(Color("ezpzLightgrey"))
                                                .padding(.leading, 30)
                                            Spacer()
                                        }
                                        .padding(.top, 20)
                                        CustomDividerView()
                                        ForEach(items) { challengeEntity in
                                            HStack {
                                                Button(action: {
                                                    sharedChallengeEntity = challengeEntity
                                                }) {
                                                    Text("\(challengeEntity.emoji ?? "") \(challengeEntity.title ?? "")")
                                                        .font(.system(size: 18))
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color("ezpzLime"))
                                                        .padding(.leading, 30)
                                                }
                                                .alert(item: $sharedChallengeEntity) { entity in
                                                    Alert(title: Text("할 일을 삭제하시겠어요?"), message: Text("한 번 지운 할 일은 복구할 수 없어요..."), primaryButton: .destructive(Text("삭제하기"), action: {
                                                        
                                                        // Action
                                                        deleteChallengeEntity(challengeEntity: entity)
                                                        
                                                    } ), secondaryButton: .cancel(Text("돌아가기")))
                                                }
                                                Spacer()
                                            }
                                            CustomDividerView()
                                        }
                                    }
                                }
                            }
                        }
                }
                Divider()
                    .background(ColorManage.ezpzSmokegrey)
            }
            
        }
    }
}


struct ColorManage {
    static let ezpzLime = Color("ezpzLime")
    static let ezpzPink = Color("ezpzPink")
    static let ezpzBlack = Color("ezpzBlack")
    static let ezpzDarkgrey = Color("ezpzDarkgrey")
    static let ezpzDeepgrey = Color("ezpzDeepgrey")
    static let ezpzDisdable = Color("ezpzDisdable")
    static let ezpzLightgrey = Color("ezpzLightgrey")
    static let ezpzSmokegrey = Color("ezpzSmokegrey")
    static let ezpzGradient = Color("ezpzGradient")
    static let ezpzGradient_ = Color("eezpzGradient_")
}

struct MyPageMainView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMainView()
    }
}
