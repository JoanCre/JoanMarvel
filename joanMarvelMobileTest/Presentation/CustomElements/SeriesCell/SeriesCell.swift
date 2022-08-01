//
//  SeriesCell.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 31/7/22.
//

import UIKit
import Lottie

class SeriesCell: UICollectionViewCell, Reusable {
//    MARK: - IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var serieImage: UIImageView!
    @IBOutlet weak var nameSerieLabel: UILabel!
    @IBOutlet weak var animatedLoader: AnimationView!

    //    MARK: - Properties
    var serie: SeriesDTO!

//    MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
//    MARK: - Functions
    func setup() {
        serieImage.layer.cornerRadius = 8
        mainView.layer.cornerRadius = 8
        mainView.layer.shadowOpacity = 0.2
        mainView.layer.shadowRadius = 3
        mainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainView.layer.masksToBounds = false

        nameSerieLabel.text = serie?.title
        loadImage()
    }

    func loadImage() {
        guard let url = URL(string: "\(serie.thumbnail.path)/\(ImageFormat.portraitIncredible.rawValue).\(serie.thumbnail.thumbnailExtension)") else { return }
        self.serieImage.af.setImage(
            withURL: url,
            placeholderImage: nil,
            filter: nil,
            imageTransition: .crossDissolve(0.5),
            completion: { _ in
                self.animatedLoader.stop()
                self.animatedLoader.isHidden = true
            }
        )
    }

    func setUpAnimation() {
        animatedLoader.animation = .named("loadingAnimation")
        animatedLoader.loopMode = .loop
        animatedLoader.play()
    }
}
