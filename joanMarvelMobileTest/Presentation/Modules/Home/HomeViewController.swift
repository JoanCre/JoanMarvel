//
//  HomeViewController.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: HomeViewModel!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        loadCharacters()
        configure(tableView: tableView)
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
            } catch { }
        }
    }
}
