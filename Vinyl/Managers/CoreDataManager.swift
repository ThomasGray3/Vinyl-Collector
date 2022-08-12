//
//  CoreDataManager.swift
//  Vinyl
//
//  Created by Thomas Gray on 12/08/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "VinylCoreData")
        self.persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core data failed \(error.localizedDescription)")
            }
        }
    }
    
    func saveAlbum(album: Album) {
        let albumData = AlbumItem(context: self.persistentContainer.viewContext)
        albumData.albumId = Int64(album.id)
        albumData.albumName = album.collectionName
        
        do {
            try self.persistentContainer.viewContext.save()
        } catch {
            // TODO: Failed to save
            print("Failed to save \(error.localizedDescription)")
        }
    }
    
    func getAlbums() -> [Album] {
        let fetchRequest: NSFetchRequest<AlbumItem> = AlbumItem.fetchRequest()
        do {
           return try self.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
