//
//  MoneyManagerApp.swift
//  MoneyManager
//
//  Created by CDMI on 13/03/26.
//

import SwiftUI

@main
struct MoneyManagerApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light) 
        }
    }
}
