//
//  ImageFetcher.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/16/25.
//

import SwiftUI

protocol ImageFetching {
    func fetchImage(from urlString: String) async -> UIImage?
}

class ImageFetcher: ImageFetching {
    static let shared = ImageFetcher()
    private let cache: ImageCaching
    
    init(cache: ImageCaching = ImageCache.shared) {
        self.cache = cache
    }
    
    func fetchImage(from urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        return await cache.image(for: url)
    }
    
    
}
