//
//  Configuration.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//

import Foundation

struct Configuration {
    static let baseUrl = "https://gateway.marvel.com:443/v1/public/"
    static let publicKey = "69b9839045fcbb4a98d1daa15b1733f0"
    static let privateKey = "6f56e50e1548978fb1ae4fd60ae19a07256980b2"
}

enum imageFormat: String {
    case portraitIncredible = "portrait_incredible"
    case squareMedium = "standard_medium"
    case landscapeIncredible = "landscape_incredible"
}
