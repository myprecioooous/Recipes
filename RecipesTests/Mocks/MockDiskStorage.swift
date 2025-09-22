//
//  MockDiskStorage.swift
//  RecipesTests
//
//  Created by Precious Camille De Los Reyes on 9/19/25.
//

import Foundation
@testable import Recipes

final class MockDiskStorage: DiskStoring {
    private var store: [String: Data] = [:]
    
    func save(_ data: Data, to fileName: String) throws {
        store[fileName] = data
    }
    
    func load(from fileName: String) -> Data? {
        store[fileName]
    }
    
    //get url
    private func fileURL(for fileName: String) -> URL {
        return URL(fileURLWithPath: "/mock/path/\(fileName)")
    }
    
    
}
