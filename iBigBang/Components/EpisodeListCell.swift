//
//  EpisodeCell.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

struct EpisodeListCell: View {
    let episode: Episode
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(episode.name)
                    .font(.headline)
                Text("Episode \(episode.number)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(episode.image)
                .resizable()
                .scaledToFit()
                .frame(width: 130)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
    }
}
#Preview {
    EpisodeListCell.preview
}
