//
//  bookscroolApp.swift
//  bookscrool
//
//  Created by Soph Codes on 10/4/23.
//

import SwiftUI

@main
struct bookscroolApp: App {
    init() {
            UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
        }
    
    var body: some Scene {
        WindowGroup {
            LibraryView()
        }
    }
}
