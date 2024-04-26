//
//  URLInteractor.swift
//  BigBangSeries
//
//  Created by Gabriel Garcia Millan on 20/4/24.
//

import Foundation

protocol URLInteractor {
    var docURL: URL { get }
    var bundleURL: URL { get }
}

struct ProductionURLS: URLInteractor {
    var docURL: URL {
        URL.documentsDirectory.appending(path: "bigbang.json")
    }
    
    var bundleURL: URL {
        Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    }
}
