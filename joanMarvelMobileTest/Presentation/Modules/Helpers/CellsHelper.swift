//
//  CellsHelper.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 31/7/22.
//

import UIKit

protocol Reusable: AnyObject {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension UITableView {
    func register(_ cell: Reusable.Type) {
        self.register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }

    func register(header: Reusable.Type) {
        self.register(header.nib, forHeaderFooterViewReuseIdentifier: header.identifier)
    }

    func dequeue<T: Reusable>(_ cell: T.Type) -> T {
        return self.dequeueReusableCell(withIdentifier: cell.identifier) as! T
    }

    func dequeue<T: Reusable>(header: T.Type) -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: header.identifier) as! T
    }
}

extension UICollectionView {
    func register(_ cell: Reusable.Type) {
        self.register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
    }

    func register(supplementaryView: Reusable.Type) {
        self.register(supplementaryView.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryView.identifier)
    }

    func dequeue<T: Reusable>(supplementaryView: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: supplementaryView.identifier, for: indexPath) as! T
    }

    func dequeue<T: Reusable>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as! T
    }
}

