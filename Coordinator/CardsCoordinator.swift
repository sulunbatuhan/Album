//
//  CardsCoordinator.swift
//  CardAlbum
//
//  Created by batuhan on 17.11.2023.
//
import Foundation
import UIKit

final class CardsCoordinator : Coordinator {
    
    var childCoordinators = [Coordinator]()
    var parentCoordinators : LoginCoordinator?
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let cardsController = CardsViewController()
        let viewModel = CardsControllerViewModel()
        viewModel.coordinator = self
        cardsController.viewModel = viewModel
        cardsController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([cardsController], animated: true)

//        navigationController.present(cardsController,animated: true)
    }
    
    func startCameraPicker(){
//        guard let navigationController = navigationController else {return}
        let cameraCoordinator = CameraCoordinator(parentCoordinator: self, navigationController)
        cameraCoordinator.start()
        self.childCoordinators.append(cameraCoordinator)
    }
    
    func childDidFinish(childCoordinator:Coordinator){
        if let index = childCoordinators.firstIndex(where: { coordinator in
            return childCoordinator === coordinator
        }){
            childCoordinators.remove(at: index)
            self.navigationController.popViewController(animated: true)
        }
    }

    
}
