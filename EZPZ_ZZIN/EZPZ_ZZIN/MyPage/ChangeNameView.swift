//
//  ChangeNameView.swift
//  EZPZ_ZZIN
//
//  Created by 최홍준 on 2022/04/12.
//

import SwiftUI

struct ChangeNameView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var user: UserEntity
    @State var username: String
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .padding(.trailing, 30.0)
                            .padding(.top, 60.0)
                            .foregroundColor(ColorManage.ezpzLightgrey)
                    }
                }
                ScrollView {
                    HStack {
                        Text("Please change the username!")
                            .font(.system(size: 18))
                            .foregroundColor(Color("ezpzLightgrey"))
                            .padding(.leading, 30)
                        Spacer()
                    }
                    .padding(.top, 20)
                    CustomDividerView()
                    VStack {
                        HStack {
                            TextField("Username", text: $username)
                                .font(.system(size: 18))
                                .foregroundColor(Color("ezpzLime"))
                                .onChange(of: username) { name in
                                    user.name = name
                                    try? viewContext.save()
                                }
                            Spacer()
                        }
                        .padding(.leading, 30)
                    }
                    CustomDividerView()
                }
            }
        }
    }
}
