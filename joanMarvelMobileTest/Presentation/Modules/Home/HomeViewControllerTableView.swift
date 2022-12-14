//
//  HomeViewControllerTableView.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func configure(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.isFiltering ? viewModel.filteredCharacters.count : viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.needToLoadMore(for: indexPath.row) {
            loadCharacters()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell else { return UITableViewCell() }
        cell.character = viewModel.isFiltering ? viewModel.filteredCharacters[indexPath.row] : viewModel.characters[indexPath.row]
        cell.setupUI()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterID = viewModel.isFiltering ? viewModel.filteredCharacters[indexPath.row].id : viewModel.characters[indexPath.row].id
        let characterDetailVC = Container.shared.characterDetailBuilder().build(characterID: characterID)
        self.present(characterDetailVC, animated: true)
    }
}
