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
    @Published var selectedSeason: Season = .season1
    
    var displayedEpisodes: [Episode] {
        episodes.filter{ $0.season == selectedSeason}
        .sorted { e1, e2 in
            e1.number < e2.number
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
