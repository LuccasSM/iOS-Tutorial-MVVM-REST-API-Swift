//
//  User.swift
//  iOS-Tutorial-MVVM-REST-API
//
//  Created by Luccas Santana Marinho on 27/04/22.
//

import Foundation

    // MARK: - Welcome

struct Welcome: Codable {
    let contacts: [Contact]
}

    // MARK: - Contact

struct Contact: Codable {
    let id, name, email: String
}
