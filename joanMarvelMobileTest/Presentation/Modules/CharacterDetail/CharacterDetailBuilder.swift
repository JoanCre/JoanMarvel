//
//  CharacterDetailBuilder.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//  
//

import UIKit

final class CharacterDetailBuilder {

	func build() -> CharacterDetailViewController {

        let viewController = UIViewController.instantiate(viewController: CharacterDetailViewController.self)

        let router = CharacterDetailRouter(viewController: viewController)
        let viewModel = CharacterDetailViewModel(router: router)

		
		viewController.viewModel = viewModel

		return viewController
	}
}
