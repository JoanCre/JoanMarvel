//
//  HomeViewModel.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//
//

import Foundation

final class HomeViewModel {

    // MARK: - Properties
    private let router: HomeRouter
    var result: ResultDTO?
    var characters = [CharacterDTO]()
    var limit = 20
    var totalCharacters = 0
    var reloadLimit = 5

    // MARK: - Init
    required init(router: HomeRouter) {
        self.router = router
    }
}

// MARK: - Functions
extension HomeViewModel {
    func needToLoadMore(for row: Int) -> Bool {
        return row == characters.count - reloadLimit ? true : false
    }

    func getCharacters() async throws {
        guard let url = URL(string: "\(Configuration.baseUrl)characters?limit=\(limit)&offset=\(characters.count)&\(Network.getAuthenticationPath())") else { return }
        let request = URLRequest(url: url)
        do {
            result = try await Network.load(request: request, of: ResultDTO.self)
            totalCharacters = result?.data.total ?? 0
            characters.append(contentsOf: result?.data.results ?? [])
        } catch {
            print(error)
        }
    }
}
