//
//  CardViewModel.swift
//  CardAlbum
//
//  Created by batuhan on 27.10.2023.
//
import Foundation
import UIKit
import Photos

struct CardViewModel : Hashable {
   
    let id = UUID()
    let asset : PHAsset
    let image : UIImage
   
}
