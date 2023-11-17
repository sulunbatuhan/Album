//
//  Coordinator.swift
//  CardAlbum
//
//  Created by batuhan on 17.11.2023.
//

import Foundation
import UIKit

protocol Coordinator:AnyObject {
    var childCoordinators : [Coordinator]{get}
    func start()
}
