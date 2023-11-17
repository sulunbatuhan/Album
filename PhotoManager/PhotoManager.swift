//
//  PhotoManager.swift
//  CardAlbum
//  Created by batuhan on 26.10.2023.
//

import Foundation
import UIKit
import Photos
import AVFoundation

final class PhotoManager{
    static let shared = PhotoManager()
    let library = PHPhotoLibrary.shared()
    var viewModel = [CardViewModel]()

    func fetchAllPhotos(completion:@escaping([CardViewModel])->()){
        viewModel = [CardViewModel]()
        let fetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = .max
        let sort = NSSortDescriptor(key: "creationDate", ascending: true)
        fetchOptions.sortDescriptors = [sort]
        
        let photo = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        photo.enumerateObjects { asset, index, stopPoint in
            let imageManager = PHImageManager.default()
            let photoSize = CGSize(width: 1000, height: 1000)
            let options = PHImageRequestOptions()
            options.isSynchronous = true
                imageManager.requestImage(for: asset, targetSize: photoSize, contentMode: .aspectFill, options: options) { image, imageInfo in
                    if let photo = image {
                        self.viewModel.append(CardViewModel(asset: asset, image: photo))
                    }
                }
            }
        
        completion(viewModel)
    }

    
    func deleteSelectedPhoto(for asset: PHAsset,completion:@escaping (Bool)->()){
        library.performChanges {
            PHAssetChangeRequest.deleteAssets([asset] as NSFastEnumeration)
        } completionHandler: { result, error in
            if error == nil {
                completion(true)
            }else {
                completion(false)
            }
        }
    }
    
    func hideSelectedPhoto(for asset: PHAsset,completion:@escaping (Bool)->()){
        library.performChanges {
            let request = PHAssetChangeRequest(for: asset)
            request.isHidden = true
        } completionHandler: { result, error in
            if error == nil {
                completion(true)
            }else {
                completion(false)
            }
        }
    }
    
    func likedPhotos(for asset: PHAsset,completion:@escaping(Bool)->()){
        library.performChanges {
            let request = PHAssetChangeRequest(for: asset)
            request.isFavorite = true
        } completionHandler: { result, error in
            if error == nil {
                completion(true)
            }else {
                completion(false)
            }
        }
    }
    
    
}
