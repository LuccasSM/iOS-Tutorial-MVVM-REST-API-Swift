//
//  Parser.swift
//  iOS-Tutorial-MVVM-REST-API
//
//  Created by Luccas Santana Marinho on 27/04/22.
//

import Foundation

struct Parser {
    func parse(comp: @escaping ([Contact]) -> ()) {
        let api = URL(string: "https://api.androidhive.info/contacts/")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? String.self)
                return
            }
            do {
                let result = try! JSONDecoder().decode(Welcome.self, from: data!)
                print(result)
                comp(result.contacts)
            }
        }.resume()
    }
}
