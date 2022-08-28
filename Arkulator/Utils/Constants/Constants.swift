//
//  Constants.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/08/22.
//

import Foundation

struct Constants {
    
    enum ColorSchemes: String, CaseIterable, Identifiable {
        case light = "Light"
        case dark = "Dark"
        
        var id: Self {
            self
        }
    }
}
