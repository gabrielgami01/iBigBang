//
//  Episode.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import Foundation

struct Episode: Codable, Identifiable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season: Season
    let number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
    var seen: Bool
    var favorite: Bool
    var rating: Int
    var notes: String
}

enum Season: Int, CaseIterable, Identifiable, Codable {
    case season1 = 1
    case season2 = 2
    case season3 = 3
    case season4 = 4
    case season5 = 5
    case season6 = 6
    case season7 = 7
    case season8 = 8
    case season9 = 9
    case season10 = 10
    case season11 = 11
    case season12 = 12
    
    var id: Self { self }
}
