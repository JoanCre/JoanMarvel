//
//  CharacterCell.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//

import UIKit
import AlamofireImage
import Lottie

class CharacterCell: UITableViewCell {

    var character: CharacterDTO!
//    MARK: - IBOtlets
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var animatedLoader: AnimationView!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
//    MARK: - Functions
    func setupUI() {
        characterNameLabel.text = character.name
        idLabel.text = String(character.id)
        thumbnailImage.layer.cornerRadius = 8
        mainView.layer.cornerRadius = 8
        mainView.layer.shadowOpacity = 0.2
        mainView.layer.shadowRadius = 2
        mainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainView.layer.masksToBounds = false

        setUpAnimation()
        loadImage()
    }

    func loadImage() {
        guard let url = URL(string: "\(character.thumbnail.path)/\(ImageFormat.squareMedium.rawValue).\(character.thumbnail.thumbnailExtension)") else { return }
        thumbnailImage.af.setImage(
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
