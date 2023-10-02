//
//  Image+Data.swift
//  Shoppier Clone
//
//  Created by fatih.sukran on 30.09.2023.
//

import Foundation
import SwiftUI
import UIKit

extension Image {
    
    /// Initializes a SwiftUI `Image` from data.
    init?(data: Data?) {
        if let data = data,
           let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            return nil
        }
    }
}
