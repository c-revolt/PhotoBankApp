//
//  SearchResults.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 17.02.2023.
//

import Foundation

struct SearchResults: Decodable {
    let tital: Int?
    let results: [Photo]?
}

struct Photo: Decodable {
    let id: String
    let width: Int
    let height: Int
    let likes: Int
    let description: String
    let urls: [URLKind.RawValue : String]
    
    enum URLKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
