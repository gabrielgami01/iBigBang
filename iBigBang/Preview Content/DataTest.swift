//
//  DataTest.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import Foundation

struct TestingURLS: URLInteractor {
    var docURL: URL {
        URL.documentsDirectory.appending(path: "bigbangtest.json")
    }
    
    var bundleURL: URL {
        Bundle.main.url(forResource: "BigBangTest", withExtension: "json")!
    }
}

extension Episode {
    static let test = Episode(id: 2928,
                              url: URL(string: "https://www.tvmaze.com/episodes/2928/the-big-bang-theory-1x16-the-peanut-reaction")!,name: "The Peanut Reaction",
                              season: .season1,
                              number: 16,
                              airdate: "2008-05-12",
                              runtime: 30,
                              image: "12464",
                              summary: "When Penny learns that Leonard doesn't celebrate birthdays, she attempts to throw him a surprise party, but is sidetracked by Sheldon who unexpectedly gets to live out one of his greatest fantasies at an electronics store.\n",
                              seen: true,
                              favorite: true,
                              rating: 2,
                              notes: "This is a note about episode number 16")
}
