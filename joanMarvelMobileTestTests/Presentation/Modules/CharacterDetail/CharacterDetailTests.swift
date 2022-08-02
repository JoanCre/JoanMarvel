//
//  CharacterDetailTests.swift
//  joanMarvelMobileTestTests
//
//  Created by Joan Cremades on 2/8/22.
//

@testable import joanMarvelMobileTest
import XCTest

class CharacterDetailTests: XCTestCase {

    var viewModel: CharacterDetailViewModel!

    override func setUp() {
        self.viewModel = CharacterDetailViewModel(router: CharacterDetailRouterFake(), characterID: 1011334)
    }

    override func tearDown() {
        viewModel = nil
    }
}

extension CharacterDetailTests {
    func testGetCharacter() {
        Task {
            let originalCount = viewModel.characters.count
            try await viewModel.getCharacter()
            let count = viewModel.characters.count
            XCTAssertEqual(count, originalCount + 1)

        }
    }

    func testGetCharacterURLError() {
        Task {
            Configuration.baseUrl = ""
            do {
                try await viewModel.getCharacter()
            } catch(let error) {
                XCTAssertEqual(error as! NetworkError, NetworkError.server)
            }
        }
    }

    func testGetSerie() {
        Task {
            let originalCount = viewModel.series.count
            try await viewModel.getSeries()
            let count = viewModel.series.count
            XCTAssertEqual(count, originalCount + 1)
        }
    }

    func testGetSerieURLError(){
        Task {
            Configuration.baseUrl = ""
            do {
                try await viewModel.getSeries()
            } catch(let error) {
                XCTAssertEqual(error as! NetworkError, NetworkError.server)
            }
        }
    }
}
