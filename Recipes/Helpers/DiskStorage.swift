//
//  DiskStorage.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/16/25.
//

import Foundation

protocol DiskStoring {
    func save(_ data: Data, to fileName: String) throws
    func load(from fileName: String) -> Data?
}

//Helper so we can save to disk
//DiskStorage only knows how to talk to the filesystem.
final class DiskStorage: DiskStoring {
    private let fileManager = FileManager.default
    private let directory: URL
    
    init(subDirectory: String = "RecipeImageCache") {
        let base = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        self.directory = base.appendingPathComponent(subDirectory)
        
        //create directory at path if it doesn't exist
        if !fileManager.fileExists(atPath: directory.path) {
            try? fileManager.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    //save
    func save(_ data: Data, to fileName: String) throws {
        let url = fileURL(for: fileName)
        try data.write(to: url)
    }
    
    //load
    func load(from fileName: String) -> Data? {
        let url = fileURL(for: fileName)
        return try? Data(contentsOf: url)
    }
    
    //get url
    private func fileURL(for fileName: String) -> URL {
        return directory.appendingPathComponent(fileName)
    }
}
