//
//  iBigBangApp.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

@main
struct iBigBangApp: App {
    @StateObject var episodeVM = EpisodesVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(EpisodesVM())
        }
    }
}
