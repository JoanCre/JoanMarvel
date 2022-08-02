//
//  HomeViewModelTests.swift
//  joanMarvelMobileTestTests
//
//  Created by Joan Cremades on 2/8/22.
//

@testable import joanMarvelMobileTest
import XCTest

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!

    override func setUp() {
        self.viewModel = HomeViewModel(router: HomeRouterFake())
    }

    override func tearDown() {
        viewModel = nil
    }
}

extension HomeViewModelTests {
    func testNeedToLoadMoreFalse() {
        let result = viewModel.needToLoadMore(for: 3)

        XCTAssertFalse(result)
    }

    func testNeedToLoadMoreTrue() {
        viewModel.reloadLimit = 0
        let result = viewModel.needToLoadMore(for: 0)

        XCTAssertTrue(result)
    }

    func testGetCharacters() {
        Task {
            try await viewModel.getCharacters()
            let count = viewModel.characters.count

            XCTAssertGreaterThan(count, 0)
        }
    }
}
