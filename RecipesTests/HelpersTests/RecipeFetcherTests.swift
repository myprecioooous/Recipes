//
//  RecipeFetcherTests.swift
//  RecipesTests
//
//  Created by Precious Camille De Los Reyes on 9/19/25.
//

import Foundation
import XCTest

@testable import Recipes

final class RecipeFetcherTests: XCTestCase {
    func testFetchRecipesSuccess() async throws {
        //Given
        let id = UUID()
        let name = "Test Recipe"
        let cuisine = "Test Cuisine"
        
        let mockRecipe = Recipe(id: id, name: name, imageURLSmall: nil, imageURLLarge: nil, cuisine: cuisine, sourceURL: nil, youtubeURL: nil)
        let mockResponse = RecipesResponse(recipes: [mockRecipe])
        let mockFetcher = MockRecipeFetcher()
        mockFetcher.mockResponse = mockResponse
        

        //When
        let response = try await mockFetcher.fetchRecipes()
        
        //Then
        XCTAssertEqual(response.recipes.count, 1)
        XCTAssertEqual(response.recipes.first?.name, "Test Recipe")
        
    }
    
    func testFetchRecipesFailure() async {
        //Given
        let shouldThrow = true
        let mockFetcher = MockRecipeFetcher()
        mockFetcher.shouldThrow = shouldThrow
        
        //When/Then
        do {
            
            _ = try await mockFetcher.fetchRecipes()
            XCTFail("Expected to throw an error but did not")
            
        } catch {
            
            XCTAssertTrue(error is URLError)
        }
        
    }
}
