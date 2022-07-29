//
//  CharacterDetailViewController.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//  
//

import UIKit

final class CharacterDetailViewController: UIViewController {

    // MARK: - IBOutlets

    // MARK: - Properties
	var viewModel: CharacterDetailViewModel!

	// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        viewModel.viewReady()

    }

    override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
        
		viewModel.viewDidAppear()
    }

    // MARK: - Functions
    private func setupBindings() {
        // Do bindings setup
    }
}
