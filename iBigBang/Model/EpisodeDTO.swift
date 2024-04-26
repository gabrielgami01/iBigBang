//
//  EpisodeDTO.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import Foundation


struct EpisodeDTO: Codable {
    let id: Int
    let url: URL
    let name: String
    let season: Season
    let number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
}

extension EpisodeDTO {
    var toPresentation: Episode {
        Episode(id: id,
                url: url,
                name: name,
                season: season,
                number: number,
                airdate: airdate,
                runtime: runtime,
                image: image,
                summary: summary,
                seen: false,
                favorite: false,
                rating: 0,
                notes: "")
    }
}
