//
//  HomeViewController.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//
//

import UIKit
import Lottie

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animatedLoader: AnimationView!

    // MARK: - Properties
    var viewModel: HomeViewModel!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        loadCharacters()
        configure(tableView: tableView)
        setUpAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Functions
    private func setupAppearance() {
        self.view.backgroundColor = UIColor.secondarySystemBackground
    }

    func loadCharacters() {
        Task {
            do {
                try await viewModel.getCharacters()
                tableView.reloadData()
                animatedLoader.stop()
        animatedLoader.isHidden = true
            } catch { }
        }
    }

    func setUpAnimation() {
        animatedLoader.animation = .named("loadingAnimation")
        animatedLoader.loopMode = .loop
        animatedLoader.play()
    }
}
