//
//  EpisodeDetails.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

struct EpisodeDetailsView: View {
    @EnvironmentObject private var episodesVM: EpisodesVM
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var editEpisodeVM: EditEpisodeVM
    
    var body: some View {
        Form {
            Section {
                LabeledContent("Air date") { Text(editEpisodeVM.episode.airdate) }
                LabeledContent("Runtime") { Text("\(editEpisodeVM.episode.runtime) min") }
                VStack(alignment: .leading) {
                    Text("Summary")
                        .padding(.bottom, 2)
                    Text(editEpisodeVM.episode.summary)
                        .foregroundStyle(.secondary)
                }
                HStack{
                    Spacer()
                    Link("Más información", destination: editEpisodeVM.episode.url)
                    Spacer()
                }
            } header: {
                Text("Episode data")
            }
            
            Section {
                CustomToggle(value: $editEpisodeVM.seen, label: "Seen", image: "eye", color: .blue)
                CustomToggle(value: $editEpisodeVM.favorite, label: "Favourited", image: "heart", color: .red)
                RatingComponent(rating: $editEpisodeVM.rating)
                VStack(alignment: .leading)  {
                    Text("Notes")
                    TextEditor(text: $editEpisodeVM.notes)
                        .frame(minHeight: 100, maxHeight: .infinity)
                        .foregroundStyle(.secondary)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 0.5)
                                .foregroundStyle(.secondary)
                                .opacity(0.5)
                        }
                        .padding(.bottom, 10)
                }
            } header: {
                Text("Personal data")
            }
        }
        .navigationTitle(editEpisodeVM.episode.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    episodesVM.updateEpisode(episode: editEpisodeVM.updateEpisode())
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    EpisodeDetailsView.preview
}
