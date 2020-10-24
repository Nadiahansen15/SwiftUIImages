////
//  MyImagePicker.swift
//  SwiftUIImages
//
//  Created by Jon Eikholm on 25/09/2020.
//

import SwiftUI

struct MyImage : UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var isPresented:Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyImage>) -> UIImagePickerController {
        let picker = UIImagePickerController() //indbygget funktionelitet som henter billedet
        // for kamera eller bibilotik
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController:UIImagePickerController, context:  UIViewControllerRepresentableContext<MyImage>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: MyImage
        init(_ parent: MyImage) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.isPresented = false
        }
    }
    
}
