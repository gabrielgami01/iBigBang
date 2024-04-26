//
//  FavEpisodesVIew.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

struct FavEpisodesView: View {
    @EnvironmentObject private var episodesVM: EpisodesVM
    
    private let columns = [GridItem(.adaptive(minimum: 150))]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(episodesVM.favEpisodes) { episode in
                        NavigationLink(value: episode){
                            EpisodeGridCell(episode: episode)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Favorite episodes")
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailsView(editEpisodeVM: EditEpisodeVM(episode: episode))
            }
        }
    }
}

#Preview {
    NavigationStack{
        FavEpisodesView.preview
    }
}


