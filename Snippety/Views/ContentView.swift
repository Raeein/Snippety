//
//  ContentView.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-18.
//

import SwiftUI

struct ContentView: View {
    #warning("Make Appstorage for FolderCreated")
    @State private var eventType: String? = "Text"
    @State private var text = ""
    var body: some View {
        NavigationView {
            FoldersView(selection: $eventType)

            TextEditor(text: $text)
            Text(text)
//            Button("Make it") {
//                makeFolder()
//            }
        }
        .touchBar {
            HStack {
                Text("Guesses: Hi")
                    .touchBarItemPrincipal()
                Spacer(minLength: 200)
            }
        }

    }
    private func makeFolder() {

        let homePath = URL(fileURLWithPath: NSHomeDirectory())
        let documentsPath = homePath.appendingPathComponent("Documents")

        let snippetyFolder = documentsPath.appendingPathComponent("Snippety")
        do {
            try FileManager.default.createDirectory(atPath: snippetyFolder.path,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
        } catch {
            print(error.localizedDescription)
            fatalError()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
