//
//  HomeScreenViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/09/22.
//

import Foundation
import RealmSwift

class HomeScreenViewModel: ObservableObject {
    
    @ObservedResults(Dinosaur.self) private var dinosaurs
    @Published var queryString = ""
    @Published var shouldRefresh = false
    
    
    var filteredResults: Results<Dinosaur> {
        if !queryString.isEmpty {
            return dinosaurs.where {
                $0.name.contains(queryString.lowercased())
            }
        }
        
        return dinosaurs
    }
        
}
