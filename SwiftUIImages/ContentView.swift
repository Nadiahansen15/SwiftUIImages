//
//  ContentView.swift
//  SwiftUIImages
//
//  Created by Nadia Hansen on 25/09/2020.
//  Copyright © 2020 Nadia Hansen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented:Bool = false
    @State var inputImage:UIImage?
    @State var imageToDisplay = Image(systemName: "phone")
    var body: some View {
        NavigationView {
            VStack {
               self.imageToDisplay.resizable()
                  .frame(width: 300, height: 300, alignment: .center)
            Button(action: {
                self.isPresented = true
            }, label: {
                Text("hent image")
            })
        }
        }.sheet(isPresented: $isPresented, onDismiss: handleImage, content: {
            MyImage(image: self.$inputImage, isPresented: self.$isPresented)
        })
    }
    func handleImage() {
        if let img = inputImage {
            self.imageToDisplay = Image(uiImage: img)
        }else {
            print("fandt ikke")
        }
    }
}

