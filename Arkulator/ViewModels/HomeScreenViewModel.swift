//
//  HomeScreenViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/09/22.
//

import Foundation
import RealmSwift

class HomeScreenViewModel: ObservableObject {

    @Published var queryString = ""
    @Published var shouldRefresh = false
    @Published var shouldShowForm = false
    
}
