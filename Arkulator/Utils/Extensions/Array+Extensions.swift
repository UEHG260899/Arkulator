//
//  Array+Extensions.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 19/07/23.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
