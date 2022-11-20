//
//  Folder.swift
//  Snippety
//
//  Created by Raeein Bagheri on 2022-11-19.
//

import SwiftUI

struct Folder: Identifiable {
    let id = UUID()
    let name: String
    let path: Path?
    var children: [Folder]?
    var icon: String {
        if children == nil {
            return "doc"
        } else if children?.isEmpty == true {
            return "folder"
        } else {
            return "folder.fill"
        }
    }

    public static func == (lhs: Folder, rhs: Folder) -> Bool {
        return lhs.id == rhs.id
    }
    init(name: String, path: Path? = nil, children: [Folder]? = nil) {
        self.name = name
        self.path = path
        self.children = children
    }
    static let items = [
        Folder(name: "Documents", children: [
            Folder(name: "Work", children: [
                Folder(name: "Revision 1.doc", children: nil),
                Folder(name: "Revision 2.doc", children: nil),
                Folder(name: "Revision 2.doc", children: [
                    Folder(name: "Last one", children: nil)
                ])
            ]),
            Folder(name: "Photo 1.jpg", children: nil),
            Folder(name: "Sheet 2.pdf", children: nil)
        ])
        ,
        Folder(name: "Photos", children: [
            Folder(name: "Photo 1.jpg", children: nil),
            Folder(name: "Photo 2.jpg", children: nil)
        ]),
        Folder(name: "Empty folder", children: []),
        Folder(name: "sys.info", children: nil)
    ]
}
extension Folder: Hashable {
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
