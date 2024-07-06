//
//  StorageManagerProtocol.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/23.
//

import Foundation
import RealmSwift

protocol StorageManagerProtocol {
    func save<T: Object>(_ object: T)
    func fetch<T: Object>(type: T.Type) -> [T]
    func fetch<T: Object>(type: T.Type, map: ArkMap) -> [T]
    func delete<T: Object>(_ object: T)
}
