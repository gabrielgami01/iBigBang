//
//  Previews.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

extension ContentView {
    static var preview: some View {
        ContentView()
            .environmentObject(EpisodesVM(interactor: BigBangInteractor(urlInteractor: TestingURLS())))
    }
}

extension EpisodesListView {
    static var preview: some View {
        EpisodesListView()
            .environmentObject(EpisodesVM(interactor: BigBangInteractor(urlInteractor: TestingURLS())))
    }
}

extension EpisodeDetailsView {
    static var preview: some View {
        NavigationStack {
            EpisodeDetailsView(editEpisodeVM: EditEpisodeVM(episode: .test))
                .environmentObject(EpisodesVM(interactor: BigBangInteractor(urlInteractor: TestingURLS())))
        }
    }
}

extension FavEpisodesView {
    static var preview: some View {
        FavEpisodesView()
            .environmentObject(EpisodesVM(interactor: BigBangInteractor(urlInteractor: TestingURLS())))
    }
}

extension EpisodeListCell {
    static var preview: some View {
        List {
            EpisodeListCell(episode: Episode.test)
        }
    }
}

extension EpisodeGridCell {
    static var preview: some View {
        List {
            EpisodeGridCell(episode: .test)
        }
    }
}

extension RatingComponent {
    static var preview: some View {
        RatingComponent(rating: .constant(3))
    }
}

extension CustomToggle {
    static var preview: some View {
        CustomToggle(value: .constant(true), label: "Seen", image: "eye", color: .blue)
    }
}

