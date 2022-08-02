//
//  CharacterDetailHomeTests.swift
//  joanMarvelMobileTestTests
//
//  Created by Joan Cremades on 2/8/22.
//

@testable import joanMarvelMobileTest
import XCTest

class CharacterDetailViewControllerTests: XCTestCase {
    var characterDetailViewController: CharacterDetailViewController!

    override func setUp() {
        self.characterDetailViewController = Container.shared.characterDetailBuilder().build(characterID: 1011334)
    }

    override func tearDown() {
        super.tearDown()
    }
}

extension CharacterDetailViewControllerTests {
    func testSetUpAnimation(){
        _ = characterDetailViewController.view
        characterDetailViewController.setUpAnimation()
        XCTAssertNotNil(characterDetailViewController.animatedLoader)
    }

    func testCollectionView(){
        _ = characterDetailViewController.view
        characterDetailViewController.configure(characterDetailViewController.collectionView)
        XCTAssertNotNil(characterDetailViewController.collectionView)
    }


}
