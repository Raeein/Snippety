//
//  FoldersView.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-19.
//

import SwiftUI

struct FoldersView: View {
    @Binding var selection: Folder?
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
        
        List(Folder.items, id: \.self, children: \.children, selection: $selection) { item in
            HStack(spacing: 6) {
                #warning("add color changing")
                Image(systemName: item.icon)
                    .foregroundColor(.blue)
                    .imageScale(.medium)
                Text(item.name)
            }
          }
        .animation(.easeIn, value: 0.2)
        .listStyle(.sidebar)
        .frame(minWidth: 180)
        .toolbar {
            ToolbarItem {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.left")
                })
            }
        }
    }
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct FoldersView_Previews: PreviewProvider {
    static var previews: some View {
        FoldersView(selection: .constant(nil))
    }
}
