//
//  FoldersView.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-19.
//

import SwiftUI

struct FoldersView: View {
    @Binding var selection: String?
    let favouritesFolder: [String] = ["Me", "You"]
    let normalFolder = [
        "Message",
        "Weather",
        "Charge",
        "This",
        "That",
        "Something",
        "Settings"
    ]

    var body: some View {

        List(selection: $selection) {
            Section("TODAY") {
                ForEach(normalFolder, id: \.self) { type in
                    Text(type)
                }
            }
        }
        .listStyle(.sidebar)
        .frame(minWidth: 180)
        .toolbar {
            ToolbarItem {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.left")
                })
            }
        }
        Spacer()
        Image(systemName: "gearshape")
    }
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct FoldersView_Previews: PreviewProvider {
    static var previews: some View {
        FoldersView(selection: .constant("Me"))
    }
}
