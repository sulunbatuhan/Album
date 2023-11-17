//
//  CardsControllerViewModel.swift
//  CardAlbum
//
//  Created by batuhan on 9.11.2023.
//

import Foundation

class CardsControllerViewModel{
   
    var coordinator : CardsCoordinator?
    
    func pickPhoto(){
        coordinator?.startCameraPicker()
    }
    
    
    
}
