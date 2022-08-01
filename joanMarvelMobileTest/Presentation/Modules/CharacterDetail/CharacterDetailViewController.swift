//
//  CharacterDetailViewController.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//
//

import UIKit
import Lottie

final class CharacterDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var animatedLoader: AnimationView!

    // MARK: - Properties
    var viewModel: CharacterDetailViewModel!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacter()
        loadSeries()
        setUpAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Functions
    func loadCharacter() {
        Task {
            do {
                try await viewModel.getCharacter()
                setupBindings()
            } catch { }
        }
    }

    func loadSeries() {
        Task {
            do {
                try await viewModel.getSeries()
                configure(collectionView)
            } catch { }
        }
    }

    private func setupBindings() {
        setImage()
        characterNameLabel.text = viewModel.characters[0].name
    }

    func setImage() {
        guard let url = URL(string: "\(viewModel.characters[0].thumbnail.path)/\(imageFormat.portraitIncredible.rawValue).\(viewModel.characters[0].thumbnail.thumbnailExtension)") else { return }
        characterImage.af.setImage(withURL: url)
        animatedLoader.stop()
    }

    func setUpAnimation() {
        animatedLoader.animation = .named("loadingAnimation")
        animatedLoader.loopMode = .loop
        animatedLoader.play()
    }
}
