//
//  EpisodesViewModel.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import Foundation

final class EpisodesVM: ObservableObject {
    let interactor: BigBangInteractor
    
    @Published var episodes = [Episode]() {
        didSet {
            saveData()
        }
    }
    
    var seasons: [[Episode]] {
        let sortedEpisodes = episodes.sorted { e1, e2 in
            e1.number < e2.number
        }
        return Dictionary(grouping: sortedEpisodes) { episode in
            episode.season
        }.values.sorted { s1, s2 in
            (s1.first?.season ?? 0) < (s2.first?.season ?? 0)
        }
    }
    
    var favEpisodes: [Episode] {
        episodes.filter{ $0.favorite }
    }
    
    init(interactor: BigBangInteractor = .shared ) {
        self.interactor = interactor
        loadEpisodes()
    }
    
    func loadEpisodes() {
        do {
            self.episodes = try interactor.loadData()
        } catch {
            print(error)
        }
    }
    
    func getEpisodeByID(id: Int) -> Episode? {
        episodes.first(where: { $0.id == id })
    }
    
    func updateEpisode(episode: Episode) {
        if let index = episodes.firstIndex(where: {$0.id == episode.id}) {
            episodes[index] = episode
        }
    }
    
    func saveData() {
        do {
            try interactor.writeData(episodes: episodes)
        } catch {
            print(error)
        }
    }
}
