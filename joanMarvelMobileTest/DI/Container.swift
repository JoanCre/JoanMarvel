//
//  Container.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//

import UIKit

class Container {
    static let shared = Container()
    var window: UIWindow!

    func changeRoot(with viewController: UIViewController){
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

extension Container {
    func homeBuilder() -> HomeBuilder {
        return HomeBuilder()
    }

    func characterDetailBuilder() -> CharacterDetailBuilder {
        return CharacterDetailBuilder()
    }
}
