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

            #if os(macOS)
           ContentView()
                .onAppear {
                     NSWindow.allowsAutomaticWindowTabbing = false
                 }
           #else
           ContentView()
           #endif
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            SidebarCommands()
            CommandGroup(replacing: .newItem) { }
            CommandGroup(replacing: .undoRedo) { }
            CommandGroup(replacing: .pasteboard) { }
        }
        Settings(content: SettingsView.init)
    }
}
