//
//  SnippetyApp.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-18.
//

import SwiftUI

@main
struct SnippetyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                     NSWindow.allowsAutomaticWindowTabbing = false
                 }
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            SidebarCommands()
            CommandGroup(replacing: .newItem) { }
            CommandGroup(replacing: .undoRedo) { }
            CommandGroup(replacing: .pasteboard) { }
        }
    }
}
