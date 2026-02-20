//
//  DataController.swift
//  Caffeine
//
//  Created by Jota Uribe on 12/06/25.
//

import CoreData
import Foundation

/// Defines convenience `CoreData` wrapper class to make easy use of iCloud sync.
public class DataController {
    private let localStore: Store
    private let cloudStore: Store
    private let cloudContainer: Container
    
    public lazy var container: NSPersistentContainer = {
        let localStoreURL = URL.storeURL(for: localStore.appGroup, databaseName: localStore.databaseName)
        let localStoreDescription = NSPersistentStoreDescription(url: localStoreURL)
        
        let cloudStoreURL = URL.storeURL(for: cloudStore.appGroup, databaseName: cloudStore.databaseName)
        let cloudStoreDescription =
        NSPersistentStoreDescription(url: cloudStoreURL)
        cloudStoreDescription.configuration = cloudStore.configuration
        
        cloudStoreDescription.cloudKitContainerOptions =
        NSPersistentCloudKitContainerOptions(
            containerIdentifier: cloudContainer.identifier)
        
        let container = NSPersistentCloudKitContainer(name: cloudContainer.name)
        container.persistentStoreDescriptions = [
            cloudStoreDescription,
            localStoreDescription
        ]
        return container
    }()
    
    /// Accessor to container `NSManagedObjectContext` viewContext.
    public var moc: NSManagedObjectContext {  container.viewContext  }
    
    public init(localStore: Store, cloudStore: Store, cloudContainer: Container) {
        self.localStore = localStore
        self.cloudStore = cloudStore
        self.cloudContainer = cloudContainer
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

extension DataController {
    /// Hold values required to configure `NSPersistentCloudKitContainer`.
    public struct Container {
        let name: String
        let identifier: String
        
        public init(name: String, identifier: String) {
            self.name = name
            self.identifier = identifier
        }
    }
    
    /// Hold values required to configure `NSPersistentStoreDescription`.
    public struct Store {
        let appGroup: String
        let databaseName: String
        let configuration: String?
        
        public init(appGroup: String, databaseName: String, configuration: String? = nil) {
            self.appGroup = appGroup
            self.databaseName = databaseName
            self.configuration = configuration
        }
    }
}

extension URL {
    /// Returns `URL` for the given app group and database pointing to the sqlite database.
    static func storeURL(for appGroup: String, databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            fatalError("Shared file container could not be created.")
        }
        
        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }
}
