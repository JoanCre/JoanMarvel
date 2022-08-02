//
//  HomeRouter.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//  
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    // MARK: - Properties
	private weak var viewController: UIViewController?

    // MARK: - Init
	required init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    // MARK: - Functions

}

protocol HomeRouterProtocol { }
