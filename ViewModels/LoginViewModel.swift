//
//  LoginViewModel.swift
//  CardAlbum
//
//  Created by batuhan on 9.11.2023.
//

import Foundation

final class LoginViewModel{
    var coordinator:LoginCoordinator?
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func showCardsController(){
        coordinator?.showCards()
    }
}
