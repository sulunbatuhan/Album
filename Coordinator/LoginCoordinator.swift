//
//  LoginCoordinator.swift
//  CardAlbum
//
//  Created by batuhan on 17.11.2023.
//
import Foundation
import UIKit

final class LoginCoordinator:Coordinator{
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginController = LoginScreenVC()
        let viewModel = LoginViewModel(coordinator: self)
        loginController.loginViewModel = viewModel
        navigationController.setViewControllers([loginController], animated: true)
    }
    
    func showCards(){
        let cardsCoordinator = CardsCoordinator(navigationController)
        cardsCoordinator.parentCoordinators = self
        self.childCoordinators.append(cardsCoordinator)
        cardsCoordinator.start()
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
