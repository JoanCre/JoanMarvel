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
    private let router: CharacterDetailRouterProtocol
    var characterID = 0
    var resultSeries: ResultSeriesDTO?
    var series = [SeriesDTO]()
    var resultCharacters: ResultDTO?
    var characters = [CharacterDTO]()

    // MARK: - Init
    required init(router: CharacterDetailRouterProtocol, characterID: Int) {
        self.router = router
        self.characterID = characterID
    }
}

// MARK: - Functions
extension CharacterDetailViewModel {
    func getCharacter() async throws {
        guard let url = URL(string: "\(Configuration.baseUrl)characters/\(characterID)?\(Network.getAuthenticationPath())") else { throw NetworkError.server }
        let request = URLRequest(url: url)
        do {
            resultCharacters = try await Network.load(request: request, of: ResultDTO.self)
            characters.append(contentsOf: resultCharacters?.data.results ?? [])
        } catch {
            print(error)
        }
    }

    func getSeries() async throws {
        guard let url = URL(string: "\(Configuration.baseUrl)characters/\(characterID)/series?\(Network.getAuthenticationPath())") else { return }
        let request = URLRequest(url: url)
        do {
            resultSeries = try await Network.load(request: request, of: ResultSeriesDTO.self)
            series.append(contentsOf: resultSeries?.data.results ?? [])
        } catch {
            print(error)
        }
    }
}
