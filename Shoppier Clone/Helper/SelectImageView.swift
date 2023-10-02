//
//  SelectImageView.swift
//  Shoppier Clone
//
//  Created by fatih.sukran on 30.09.2023.
//

import SwiftUI
import PhotosUI

struct SelectImageView: View {
    
    @State private var photoPickerItem: PhotosPickerItem?
    @Binding var selectedImage: Data?
    
    var body: some View {
        
        VStack {
            PhotosPicker(selection: $photoPickerItem, matching: .images, photoLibrary: .shared()) {
                Text("Select Image") //, systemImage: "add")
            }
            .task(id: photoPickerItem) {
                selectedImage = try? await photoPickerItem?.loadTransferable(type: Data.self)
            }
        }
    }
        
}

fileprivate struct MyView: View {
    
    @State var image: Data?
    
    var body: some View {
        SelectImageView(selectedImage: $image)
    }
}

#Preview {
    MyView()
}

