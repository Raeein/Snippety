//
//  ContentView.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-18.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                
                Text("Services")
                
                Group{
                    NavigationLink(destination: ContentView()) {
                        Label("Message", systemImage: "message")
                    }
                    NavigationLink(destination: ContentView()) {
                        Label("Weather", systemImage: "cloud.sun")
                    }
                    NavigationLink(destination: ContentView()) {
                        Label("Charge", systemImage: "bolt.car")
                    }
                    NavigationLink(destination: ContentView()) {
                        Label("HealthCare", systemImage: "pills")
                    }
                    NavigationLink(destination: ContentView()) {
                        Label("Ticket", systemImage: "ticket")
                    }
                    NavigationLink(destination: ContentView()) {
                        Label("Calculator", systemImage: "function")
                    }
                }
                
                //Add some space :)
                Spacer()
                Text("More")
                NavigationLink(destination: ContentView()) {
                    Label("Shortcut", systemImage: "option")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Customize", systemImage: "slider.horizontal.3")
                }
                //Add some space again!
                Spacer()
                //Divider also looks great!
                Divider()
                NavigationLink(destination: ContentView()) {
                    Label("Settings", systemImage: "gear")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Explore")
            .frame(minWidth: 180)
            .toolbar{
                ToolbarItem {
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
            }
            Text("Main View")
                .frame(width: 100, height: 100)
        }
    }
    private func toggleSidebar() { // 2
        
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
