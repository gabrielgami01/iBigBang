//
//  BigBangInteractor.swift
//  BigBangSeries
//
//  Created by Gabriel Garcia Millan on 20/4/24.
//

import Foundation

struct BigBangInteractor: URLInteractor, JSONInteractor {
    static let shared = BigBangInteractor()
    
    let urlInteractor: URLInteractor
    
    let docURL: URL
    let bundleURL: URL
    
    init(urlInteractor: URLInteractor = ProductionURLS()) {
        self.urlInteractor = urlInteractor
        self.docURL = urlInteractor.docURL
        self.bundleURL = urlInteractor.bundleURL
    }
    
    func loadData() throws -> [Episode] {
        if FileManager.default.fileExists(atPath: docURL.path()) {
            try getFromJSON(url: docURL, type: [Episode].self)
        } else {
            try getFromJSON(url: bundleURL, type: [EpisodeDTO].self).map(\.toPresentation)
        }
    }
    
    func writeData(episodes: [Episode]) throws {
        try writeToJSON(file: docURL.lastPathComponent, data: episodes)
    }
    
}
