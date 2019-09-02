//
//  CloudContainer.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 01/09/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import Foundation
import CloudKit

class CloudContainer {
    
    static let share = CloudContainer()
    
    
    var container: CKContainer!
    var publicDatabase: CKDatabase!
    var privateDatabase: CKDatabase!
    var sharedDatabse: CKDatabase!
    
    private init() {
        
        container = CKContainer.default()
        publicDatabase = container.publicCloudDatabase
        privateDatabase = container.privateCloudDatabase
        sharedDatabse = container.sharedCloudDatabase
    }
    
}
