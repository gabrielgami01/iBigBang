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
            List(episodesVM.seasons, id: \.self) { season in
                Section {
                    ForEach(season) { episode in
                        NavigationLink(value: episode) {
                            EpisodeCell(episode: episode)
                        }
                    }
                } header: {
                    Text("Season \(season.first?.season ?? 0)")
                }
            }
            .navigationTitle("Big Bang Theory")
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailsView(editEpisodeVM: EditEpisodeVM(episode: episode))
            }
        }
    }
}

#Preview {
    EpisodesListView.preview
}


