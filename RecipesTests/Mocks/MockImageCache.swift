//
//  MockImageCache.swift
//  RecipesTests
//
//  Created by Precious Camille De Los Reyes on 9/19/25.
//

import SwiftUI
@testable import Recipes

final class MockImageCache: ImageCaching {
    
    var storedImages: [URL:UIImage] = [:]
    var shouldReturnNil = false
    
    func image(for url: URL) async -> UIImage? {
        if shouldReturnNil { return nil }
        return storedImages[url]
    }

}
