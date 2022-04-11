//
//  CardView.swift
//  Journal
//
//  Created by Hyunjae on 4/7/22.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var journalEntity: JournalEntity
    
    func loadImage() -> UIImage {
        guard let fileName = journalEntity.image else {
            return UIImage(named: "cat")!
        }
        let document = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = document.appendingPathComponent(fileName)
        var result: UIImage = UIImage(named: "cat")!
        do {
            let data = try Data(contentsOf: url)
            result = UIImage(data: data)!
        } catch {
            print(error)
        }
        return result
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: loadImage())
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(height: 230.0)
                .clipped()
                .cornerRadius(18)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundColor(.black)
                        .opacity(0.3)
                )
            VStack(alignment: .leading) {
                HStack {
                    Text(journalEntity.title ?? "")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .font(.system(size: 21))
                    Spacer()
                    Circle()
                        .overlay(
                            Text(journalEntity.emoji ?? "")
                                .font(.system(size: 35))
                        )
                        .frame(width: 50, height: 50)
                        .padding(.trailing, 20)
                        .foregroundColor(Color("ezpzLightgrey"))
                } // HStack
                Text(journalEntity.text ?? "")
                    .fontWeight(.medium)
                    .lineSpacing(5)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .frame(height: 100)
                    .padding(.horizontal, 15)
                    .multilineTextAlignment(.leading)
                HStack {
                    Spacer()
                    Text("\(journalEntity.date!, formatter: dateFormatter)")
                        .padding(.trailing, 20)
                } // HStack
            } // VStack
        } // ZStack
            
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter
}()
