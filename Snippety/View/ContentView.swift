//
//  ContentView.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-18.
//

import SwiftUI

struct ContentView: View {
#warning("Make Appstorage for FolderCreated")
    @State private var eventType: Folder?
    @State private var text = ""
    @State private var wordCount = 0
    @AppStorage("showWordCount") var showWordCount = true
    var body: some View {
        NavigationView {
            FoldersView(selection: $eventType)
            TextEditor(text: $text)
                .font(Font.custom("Helvetica Neue", size: 15))
                .padding()
                .onChange(of: text) { _ in
                    getWordCount()
                }
            VStack {
                Text(text)
                Spacer()
                if showWordCount {
                    HStack(alignment: .lastTextBaseline) {
                        Text("\(wordCount)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding([.bottom, .trailing], 8)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
        }
        .onAppear(perform: {
            makeFolder()
        })
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
        if FileManager.default.fileExists(atPath: snippetyFolder.path) {
            print("Already exists")
            return
        }
        do {
            try FileManager.default.createDirectory(atPath: snippetyFolder.path,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
        } catch {
            print(error.localizedDescription)
            fatalError()
        }
    }
    private func getWordCount() {
        let characterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let components = text.components(separatedBy: characterSet)
        let words = components.filter { !$0.isEmpty }
        wordCount = words.count
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
