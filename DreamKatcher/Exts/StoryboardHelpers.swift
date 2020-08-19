//
//  StoryboardHelpers.swift
//  DreamKatcher
//
//  Created by Sukumar Anup Sukumaran on 20/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardProtocol: class {
    static var sceneStoryboard: UIStoryboard { get }
    static var sceneIdentifier: String { get }
}

extension StoryboardProtocol {
    static var sceneIdentifier: String {
        return String(describing: self)
    }
}

extension StoryboardProtocol where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = Self.sceneStoryboard
        let viewController = storyboard.instantiateViewController(withIdentifier: self.sceneIdentifier)
        guard let conformingViewController = viewController as? Self else {
            fatalError("View Controller Is Not Of Type or Class '\(self)'.")
        }
        return conformingViewController
    }
}
