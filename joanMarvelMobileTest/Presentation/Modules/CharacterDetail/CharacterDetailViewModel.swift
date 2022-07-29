//
//  CharacterDetailViewModel.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//  
//

import Foundation

final class CharacterDetailViewModel {

    // MARK: - Properties
	private let router: CharacterDetailRouter

    // MARK: - Init
	required init(router: CharacterDetailRouter) {
		self.router = router
	}

}

// MARK: - Life cycle
extension CharacterDetailViewModel {
	func viewReady() {
		// Called when view is loaded and ready
	}

	func viewDidAppear() {

	}
}

// MARK: - Functions
extension CharacterDetailViewModel {
}
