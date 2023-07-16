//
//  RealmManagerProtocol.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/23.
//

import Foundation
import RealmSwift

protocol RealmManagerProtocol {
    func save<T: Object>(_ object: T)
    func fetch<T: Object>(type: T.Type) -> Results<T>
    func delete<T: Object>(_ object: T)
}
