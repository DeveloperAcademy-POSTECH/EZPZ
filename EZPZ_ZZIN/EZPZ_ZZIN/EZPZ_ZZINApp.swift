//
//  EZPZ_ZZINApp.swift
//  EZPZ_ZZIN
//
//  Created by Yeni Hwang on 2022/04/11.
//

import SwiftUI

@main
struct EZPZ_ZZINApp: App {

    let persistenceController = PersistenceController.shared
    

    var body: some Scene {
        WindowGroup {
            EZPZStartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
         
        }
    }
}
