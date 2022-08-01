//
//  HomeBuilder.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//
//

import UIKit

final class HomeBuilder {
    func build() -> HomeViewController {
        guard let viewController = UIStoryboard(name: "HomeView", bundle: nil).instantiateViewController(withIdentifier: "HomeView") as? HomeViewController
            else {
            fatalError("Error instantiate HomeViewController")
        }
        let router = HomeRouter(viewController: viewController)
        let viewModel = HomeViewModel(router: router)
        viewController.viewModel = viewModel

        return viewController
    }
}
