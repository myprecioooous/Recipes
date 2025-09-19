//
//  ImageCache.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/16/25.
//

import CryptoKit
import SwiftUI

protocol ImageCaching {
    func image(for url: URL) async -> UIImage?
    
}

//ImageCache orchestrates memory/disk/network layers
final class ImageCache: ImageCaching {
    static let shared = ImageCache()
    
    //Images are cached in-memory for speed
    private let memoryCache = NSCache<NSString, UIImage>()
    
    //Images are saved to disk manually - to disk manually. On next app launch, disk cache is checked before hitting network
    private let diskStorage: DiskStoring
    
    init(diskStorage: DiskStoring = DiskStorage()) {
        self.diskStorage = diskStorage
    }
    
    func image(for url: URL) async ->  UIImage? {
        let key = url.absoluteString as NSString
        
        //Memory cache
        if let image = memoryCache.object(forKey: key) { return image }
        
        //Disk cache
        let fileName = url.absoluteString.sha256
        if let data = diskStorage.load(from: fileName), let image = UIImage(data: data) {
            memoryCache.setObject(image, forKey: key)
            return image
        }
        
        //Network
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                memoryCache.setObject(image, forKey: key)
                Task.detached(priority: .background) {
                    try? self.diskStorage.save(data, to: fileName)
                }
                
                return image
                
            }
        } catch {
            print("❌ Image download failed:", error)
        }
        
        return nil
    }
}

extension String {
    var sha256: String {
        let data = Data(self.utf8)
        let hash = SHA256.hash(data: data)
        return hash.compactMap { String(format: "%02x", $0) }.joined()
    }
}
