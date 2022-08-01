//
//  CharacterDetailBuilder.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//
//

import UIKit

final class CharacterDetailBuilder {
    func build(characterID: Int) -> CharacterDetailViewController {
        guard let viewController = UIStoryboard(name: "CharacterDetailView", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetailView") as? CharacterDetailViewController else { fatalError("Error instantiate CharacterDetailViewController") }
        let router = CharacterDetailRouter(viewController: viewController)
        let viewModel = CharacterDetailViewModel(router: router, characterID: characterID)
        viewController.viewModel = viewModel

        return viewController
    }
}
