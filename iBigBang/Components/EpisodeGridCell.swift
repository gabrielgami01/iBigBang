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
            
            Image(episode.image)
                .resizable()
                .frame(width: 160, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text("Season \(episode.season.rawValue)")
                .font(.footnote).foregroundStyle(.secondary)
            Text(episode.name)
                .font(.caption)
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    EpisodeGridCell(episode: .test)
}
