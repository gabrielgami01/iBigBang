//
//  iBigBangTests.swift
//  iBigBangTests
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import XCTest
@testable import iBigBang

final class iBigBangTests: XCTestCase {
    var urls: URLInteractor!
    var interactor: BigBangInteractor!
    var episodesVM: EpisodesVM!

    override func setUpWithError() throws {
        urls = TestingURLS()
        interactor = BigBangInteractor(urlInteractor: urls)
        episodesVM = EpisodesVM(interactor: interactor)
    }

    override func tearDownWithError() throws {
        episodesVM = nil
        interactor = nil
        if FileManager.default.fileExists(atPath: urls.docURL.path()){
            try FileManager.default.removeItem(at: urls.docURL)
        }
        urls = nil
    }
    
    func testInteractorLoadData() throws {
        let data = try interactor.loadData()
        XCTAssertGreaterThan(data.count, 0)
        XCTAssertEqual(data.count, 24)
    }
    
    func testInteractorWriteData() throws {
        var data = try interactor.loadData()
        let dataPre = data
        data.removeFirst()
        try interactor.writeData(episodes: data)
        let dataPost = try interactor.loadData()
        XCTAssertNotEqual(dataPre, dataPost)
        XCTAssertEqual(dataPre.count - 1 , dataPost.count)
    }
    
    func testEpisodesVMLoadEpisodes() throws {
        XCTAssertGreaterThan(episodesVM.episodes.count, 0)
        XCTAssertEqual(episodesVM.episodes.count, 24)
    }
    
    func testEpisodesVMSeasons() throws {
        for season in episodesVM.seasons {
            let firstEpisode = try XCTUnwrap(season.first)
            let lastEpisode = try XCTUnwrap(season.last)
            XCTAssertEqual(firstEpisode.season, lastEpisode.season)
        }
    }
    
    func testEpisodesVMGetEpisodeByID() throws {
        let episode = try XCTUnwrap(episodesVM.episodes.randomElement())
        let episodeById = episodesVM.getEpisodeByID(id: episode.id)
        XCTAssertNotNil(episodeById)
        XCTAssertEqual(episode, episodeById)
    }
    
    func testEpisodesVMUpdateEpisode() throws {
        let episode = try XCTUnwrap(episodesVM.episodes.randomElement())
        let updateEpisode = Episode(id: episode.id, url: episode.url, name: episode.name, season: episode.season, number: episode.number, airdate: episode.airdate, runtime: episode.runtime, image: episode.image, summary: episode.summary, seen: true, favorite: true, rating: 3, notes: "I love this episode")
        episodesVM.updateEpisode(episode: updateEpisode)
        let updatedEpisode = episodesVM.getEpisodeByID(id: updateEpisode.id)
        XCTAssertEqual(updateEpisode, updatedEpisode)
    }
    
    func testEpisodesVMAutoSave() throws {
        let episodesPre = episodesVM.episodes
        episodesVM.episodes.removeLast()
        episodesVM.loadEpisodes()
        XCTAssertNotEqual(episodesPre, episodesVM.episodes)
    }

}
