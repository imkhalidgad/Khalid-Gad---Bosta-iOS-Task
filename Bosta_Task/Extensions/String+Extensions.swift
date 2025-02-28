//
//  String+Extensions.swift
//  Bosta_Task
//
//  Created by Khalid Gad on 27/02/2025.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
