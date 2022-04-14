//
//  EditorView.swift
//  Journal
//
//  Created by Hyunjae on 4/8/22.
//

import SwiftUI

struct ImageEmojiView: View {
    
    let emoji: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke()
                .foregroundColor(Color("ezpzDisdable"))
            VStack {
                HStack {
                    Spacer()
                    Circle()
                        .overlay(
                            Text(emoji)
                                .font(.system(size: 35))
                                .foregroundColor(Color("ezpzPink"))
                        )
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("ezpzLightgrey"))
                }
                Spacer()
            }
            .padding(.all, 20)
            VStack(spacing: 20) {
                Image(systemName: "photo.fill.on.rectangle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("ezpzDisdable"))
                Text("이미지를 추가해주세요")
                    .font(.system(size: 16))
                    .foregroundColor(Color("ezpzDisdable"))
            }
        }
        .frame(height: 380)
    }
}

struct ImageView: View {
    
    let imageString: String
    let emoji: String
    
    func loadImage() -> UIImage? {
        let document = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = document.appendingPathComponent(imageString)
        var result: UIImage? = nil
        do {
            let data = try Data(contentsOf: url)
            result = UIImage(data: data)
        } catch {
            print(error)
        }
        return result
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: loadImage()!)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.size.width, height: 380)
                .clipped()
            VStack {
                HStack {
                    Spacer()
                    Circle()
                        .overlay(
                            Text(emoji)
                                .font(.system(size: 35))
                        )
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("ezpzLightgrey"))
                }
                Spacer()
            }
            .padding(.all, 20)
        }
        .frame(height: 380)
    }
}

struct EditorView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: JournalEntity
    @State private var isShowingPhotoPicker = false
    @State private var text: String
    
    init(item: JournalEntity) {
        
        self.item = item
        text = item.text ?? "돌아보기를 작성해주세요"
        
        // TextEditor의 배경을 투명하게 만들어준다.
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color("ezpzBlack")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("\(item.date!, formatter: dateFormatter)")
                        .font(.system(size: 17))
                        .foregroundColor(Color("ezpzLightgrey"))
                        .padding(.leading, 20)
                    Spacer()
                }
                if let fileName = item.image {
                    ImageView(imageString: fileName, emoji: item.emoji ?? "🚎")
                        .onTapGesture {
                            isShowingPhotoPicker = true
                        }
                } else {
                    ImageEmojiView(emoji: item.emoji ?? "")
                        .onTapGesture {
                            isShowingPhotoPicker = true
                        }
                }
                TextEditor(text: $text)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .onChange(of: text) {
                        item.text = $0
                        try? viewContext.save()
                    }
                Text("저장하기")
                    .foregroundColor(Color("ezpzLime"))
                    .font(.system(size: 17))
                    .frame(width: 356, height: 40)
                    .background(Color("ezpzDarkgrey"))
                    .cornerRadius(10)
                    .onTapGesture {
                        item.text = text
                        print(item.text ?? "")
                        try? viewContext.save()
                    }
            }
        }
        .navigationTitle("\(item.emoji ?? "") \(item.title ?? "")")
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPicker(item: item)
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter
}()
