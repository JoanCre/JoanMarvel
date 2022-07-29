//
//  CharacterCell.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//

import UIKit
import AlamofireImage

class CharacterCell: UITableViewCell {

    var character: CharacterDTO!
//    MARK: - IBOtlets
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var thumbnailImage: UIImageView!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
//    MARK: - Functions
    func setupUI() {
        characterNameLabel.text = character.name
        idLabel.text = String(character.id)
        mainView.layer.cornerRadius = 8
        mainView.layer.shadowOpacity = 0.2
        mainView.layer.shadowRadius = 2
        mainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainView.layer.masksToBounds = false
        loadImage()
    }

    func loadImage() {
        guard let url = URL(string: "\(character.thumbnail.path)/\(imageFormat.squareMedium.rawValue).\(character.thumbnail.thumbnailExtension)") else { return }
        thumbnailImage.af.setImage(withURL: url)
    }
}
