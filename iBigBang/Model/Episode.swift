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
    let season: Int
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
