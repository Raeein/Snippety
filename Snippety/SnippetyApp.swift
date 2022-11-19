//
//  SnippetyApp.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-18.
//

import SwiftUI

@main
struct SnippetyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands() // 1
        }
    }
}
