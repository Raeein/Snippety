//
//  SettingsView.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-19.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("showWordCount") var showWordCount = true
    var body: some View {
        TabView {
            Form {
                Toggle("Show word count", isOn: $showWordCount)
                    .help("This shows the word count of the current document.")
            }
            .padding()
            .tabItem {
                Label("Settings", systemImage: "gearshape.2")
            }
        }
        .frame(width: 400)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
