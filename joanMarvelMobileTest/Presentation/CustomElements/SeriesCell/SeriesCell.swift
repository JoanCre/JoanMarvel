//
//  SeriesCell.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 31/7/22.
//

import UIKit

class SeriesCell: UICollectionViewCell, Reusable {
//    MARK: - IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var serieImage: UIImageView!
    @IBOutlet weak var nameSerieLabel: UILabel!
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
        guard let url = URL(string: "\(serie.thumbnail.path)/\(imageFormat.portraitIncredible.rawValue).\(serie.thumbnail.thumbnailExtension)") else { return }
        serieImage.af.setImage(withURL: url)
    }
}
