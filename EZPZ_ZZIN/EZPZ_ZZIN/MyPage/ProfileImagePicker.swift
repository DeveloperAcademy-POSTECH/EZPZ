//
//  ProfileImagePicker.swift
//  EZPZ_ZZIN
//
//  Created by Hyunjae Lee on 2022/04/13.
//

import SwiftUI

struct ProfileImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var user: UserEntity
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: ProfileImagePicker
        
        init(photoPicker: ProfileImagePicker) {
            self.photoPicker = photoPicker
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
        
        // 이미지를 파일로 저장하고 파일명을 String으로 돌려준다.
        func saveImage(image: UIImage) -> String {
            let document = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileName = UUID().uuidString
            let url = document.appendingPathComponent(fileName)
            let data = image.jpegData(compressionQuality: 1)!
            do {
                try data.write(to: url)
            } catch {
                print(error)
            }
            return fileName
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                // 기존의 이미지가 존재할 경우 삭제한다.
                if let imageString: String = photoPicker.user.image {
                    removeImage(imageString: imageString)
                    photoPicker.user.image = nil
                }
                
                // 이미지를 파일로 저장하고 파일명을 기록한다.
                let fileName = saveImage(image: image)
                photoPicker.user.image = fileName
                
                // CoreData를 저장하고 이미지 선택 창을 닫는다.
                try? photoPicker.viewContext.save()
                picker.dismiss(animated: true)
            }
        }
    }
}
