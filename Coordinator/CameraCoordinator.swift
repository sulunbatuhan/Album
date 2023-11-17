//
//  CameraCoordinator.swift
//  CardAlbum
//
//  Created by batuhan on 9.11.2023.
//
import Foundation
import UIKit
import Photos
import PhotosUI
import AVFoundation

final class CameraCoordinator : NSObject,Coordinator {
    
    var childCoordinators = [Coordinator]()
    var parentCoordinator : CardsCoordinator?
    
    var navigationController : UINavigationController?
    
    init(parentCoordinator: CardsCoordinator,_ navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        guard let navigationController = navigationController else {return}
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        navigationController.present(picker, animated: true)
    }
    
    func didFinishPicking(){
        parentCoordinator?.childDidFinish(childCoordinator: self)
    }
    let notificationCenter : NotificationCenter = NotificationCenter.default
}

extension CameraCoordinator : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {return}
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        notificationCenter.post(name: .notificationRefresh, object: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}

extension Notification.Name {
    static let notificationRefresh = Notification.Name(rawValue: "NotificationRefresh")
}
