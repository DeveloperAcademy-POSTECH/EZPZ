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
    @State private var showModal = false
    @State private var showingAlert = false
    
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
                                Button("닉네임 변경하기") { }
                                Button("프로필 이미지 변경하기") { }
                                Button("프로필 이미지 삭제하기", role: .destructive) { }
                                Button("Cancel", role: .cancel) { }
                            })
                    }
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(ColorManage.ezpzDisdable)
                        .frame(width: 356, height: 110)
                    HStack {
                        Circle()
                            .frame(width: 70, height: 70)
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
                        Text("푸시 알람 설정")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                            .padding(.leading, 17.0)
                            .padding([.top,.bottom], 5)
                        Spacer()
                    }
                    Divider()
                        .background(ColorManage.ezpzSmokegrey)
                    HStack {
                        Text("라이센스 정보")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                            .padding(.leading, 17.0)
                            .padding([.top,.bottom], 5)
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
                    Button(action: {showingAlert = true}) {
                        Text("도전 포기하기")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                            .opacity(0.5)
                            .padding(.leading, 17.0)
                            .padding([.top,.bottom], 5)
                    }
                        .alert("포기할 도전을 선택해주세요", isPresented: $showingAlert) {
                            Button("삭제", role: .destructive) {}
                            } message: {
                            Text("도전을 정말 삭제하시겠어요?")
                            }
                    Spacer()
                }
                Divider()
                    .background(ColorManage.ezpzSmokegrey)
            }
        }
    }
}


struct ModalView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var body: some View {
    Group {
      Text("포기할 버튼을 선택해주세요")
      Button(action: {
          self.presentationMode.wrappedValue.dismiss()
      }) {
        Text("Dismiss")
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
