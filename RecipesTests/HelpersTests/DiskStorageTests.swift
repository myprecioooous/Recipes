//
//  DiskStorageTests.swift
//  RecipesTests
//
//  Created by Precious Camille De Los Reyes on 9/19/25.
//

import Foundation

import XCTest

@testable import Recipes

final class DiskStorageTests: XCTestCase {
    func testSaveAndLoadData() throws {
        //Given
        let mockDisk = MockDiskStorage()
        let data = "Hello World".data(using: .utf8)!
        
        //When
        try mockDisk.save(data, to: "testfile")
        let loadedData = mockDisk.load(from: "testfile")
        
        //Then
        XCTAssertNotNil(loadedData)
        XCTAssertEqual(loadedData, data)
        
    }
}
