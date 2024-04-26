//
//  EditEpisodeVM.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import Foundation

final class EditEpisodeVM: ObservableObject {
    let episode: Episode
    
    @Published var seen = false
    @Published var favorite = false
    @Published var rating = 0
    @Published var notes = ""
    
    init(episode: Episode) {
        self.episode = episode
        loadEpisodeData()
    }
    
    func loadEpisodeData() {
        self.seen = episode.seen
        self.favorite = episode.favorite
        self.rating = episode.rating
        self.notes = episode.notes
    }
    
    func updateEpisode() -> Episode {
        Episode(id: episode.id,
                url: episode.url,
                name: episode.name,
                season: episode.season,
                number: episode.number,
                airdate: episode.airdate,
                runtime: episode.runtime,
                image: episode.image,
                summary: episode.summary,
                seen: seen,
                favorite: favorite,
                rating: rating,
                notes: notes)
    }
}
