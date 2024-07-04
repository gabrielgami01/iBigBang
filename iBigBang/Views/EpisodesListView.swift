//
//  EpisodesListVIew.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

struct EpisodesListView: View {
    @EnvironmentObject private var episodesVM : EpisodesVM
    
    var body: some View {
        NavigationStack {
            List(episodesVM.displayedEpisodes) { episode in
                NavigationLink(value: episode) {
                    EpisodeListCell(episode: episode)
                }
            }
            .navigationTitle("Episodes")
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailsView(editEpisodeVM: EditEpisodeVM(episode: episode))
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Picker(selection: $episodesVM.selectedSeason) {
                        ForEach(Season.allCases) { season in
                            Text("Season \(season.rawValue)")
                        }
                    } label: {
                        Text(episodesVM.selectedSeason.rawValue.formatted())
                    }

                }
            }
        }
    }
}

#Preview {
    EpisodesListView.preview
}


