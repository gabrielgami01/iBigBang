//
//  EpisodeGridCell.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 26/4/24.
//

import SwiftUI

struct EpisodeGridCell: View {
    let episode: Episode
    
    var body: some View {
        VStack(alignment: .center) {
            Text(episode.name)
                .font(.caption)
                .lineLimit(1)
            Text("Season \(episode.season.rawValue)")
                .font(.footnote).foregroundStyle(.secondary)
            Image(episode.image)
                .resizable()
                .frame(width: 160, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    EpisodeGridCell(episode: .test)
}
