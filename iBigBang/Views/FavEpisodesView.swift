//
//  FavEpisodesVIew.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

struct FavEpisodesView: View {
    @EnvironmentObject private var episodesVM: EpisodesVM
    
    let fixedItems: [GridItem] = [GridItem(.fixed(115)), GridItem(.fixed(115)), GridItem(.fixed(115))]
    let flexibleItems: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private let columns = [GridItem(.adaptive(minimum: 150))]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(episodesVM.favEpisodes) { episode in
                        VStack {
                            Text(episode.name)
                                .font(.caption)
                            Text("Season \(episode.season)")
                                .font(.footnote).foregroundStyle(.secondary)
                            Image(episode.image)
                                .resizable()
                                .frame(width: 150, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FavEpisodesView.preview
    }
}
