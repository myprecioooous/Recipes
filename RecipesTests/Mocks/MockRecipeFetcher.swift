//
//  MockRecipeFetcher.swift
//  RecipesTests
//
//  Created by Precious Camille De Los Reyes on 9/19/25.
//

import Foundation

@testable
import Recipes

final class MockRecipeFetcher: RecipeFetching {
    var mockResponse: RecipesResponse?
    var shouldThrow = false
    
    func fetchRecipes() async throws -> RecipesResponse {
        if shouldThrow {
            throw URLError(.badURL)     //or a custom type
        }
        
        return mockResponse ?? RecipesResponse(recipes: [])
    }
    
}
