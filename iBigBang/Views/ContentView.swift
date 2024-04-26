//
//  ContentView.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            EpisodesListView()
                .tabItem { Label("Episodes", systemImage: "tv.fill") }
            FavEpisodesView()
                .tabItem { Label("Favorites", systemImage: "heart.fill") }
        }
    }
}

#Preview {
    ContentView.preview
}
