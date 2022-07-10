//
//  UIApplication+Extensions.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 10/07/22.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
