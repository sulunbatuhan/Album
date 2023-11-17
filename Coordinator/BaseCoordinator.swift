//
//  BaseCoordinator.swift
//  CardAlbum
//
//  Created by batuhan on 17.11.2023.
//
import Foundation
import UIKit

final class BaseCoordinator: Coordinator {
    
    private(set) var childCoordinators = [Coordinator]()
    private let window : UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationControllers = UINavigationController()
        let loginCoordinator = LoginCoordinator(navigationControllers)
        loginCoordinator.start()
        self.childCoordinators.append(loginCoordinator)
        window.rootViewController = navigationControllers
        window.makeKeyAndVisible()
    }
    
    
}
