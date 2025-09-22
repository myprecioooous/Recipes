//
//  ImageCacheTests.swift
//  RecipesTests
//
//  Created by Precious Camille De Los Reyes on 9/19/25.
//

import Foundation

import XCTest

@testable import Recipes

final class ImageCacheTests: XCTestCase {
    func testLoadFromDiskCache() async {
        //Given
        let mockDisk = MockDiskStorage()
        let cache = ImageCache(diskStorage: mockDisk)
        
        let data = UIImage(systemName: "photo")!.pngData()!
        try? mockDisk.save(data, to: "https://example.com/image.png".sha256)
        
        let url = URL(string: "https://example.com/image.png")!
        
        //When
        let loadedImage = await cache.image(for: url)
        
        //Then
        XCTAssertNotNil(loadedImage)
        
    }
}
