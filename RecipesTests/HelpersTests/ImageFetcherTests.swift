//
//  ImageFetcherTests.swift
//  RecipesTests
//
//  Created by Precious Camille De Los Reyes on 9/19/25.
//

import Foundation
import XCTest

@testable import Recipes

final class ImageFetcherTests: XCTestCase {
    func testFetchImageFromCache() async {
        //Given
        let url = URL(string: "https://example.com/test.png")!
        let expectedImage = UIImage(systemName: "photo")!
        let mockCache = MockImageCache()
        mockCache.storedImages[url] = expectedImage
        
        //can just use ImageFetcher directly since it's just a wrapper anyway for ImageCache
        let fetcher = ImageFetcher(cache: mockCache)
        
        //When
        let image = await fetcher.fetchImage(from: url.absoluteString)
        
        //Assert
        XCTAssertEqual(image, expectedImage)
    }
}
