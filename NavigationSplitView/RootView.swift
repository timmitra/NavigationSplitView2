//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by Tim Mitra on 2024-05-09.
//

import SwiftUI

struct RootView: View {
  @State private var selectedFolder: String?
  @State private var selectedItem: String?
  
  @State private var folders = [
    "All": [
      "Item1",
      "Item2"
    ],
    "Favorites": [
      "Item2"
    ]
  ]
  
  var body: some View {
    // two column
    NavigationSplitView {
      // side bar
      List(selection: $selectedFolder) {
        ForEach(Array(folders.keys.sorted()), id: \.self) { folder in
          NavigationLink(value: folder) {
            Text(verbatim: folder)
          }
        }
      }
      .navigationTitle("Sidebar")
    } content: {
      if let selectedFolder {
        List(selection: $selectedItem) {
          ForEach(folders[selectedFolder, default: []], id: \.self) { item in
            NavigationLink(value: item) {
              Text(verbatim: item)
            }
          }
        }
        .navigationTitle(selectedFolder)
      } else {
        Text("Choose a folder from the sidebar")
      }
    } detail: {
      // item details
      if let selectedItem {
        NavigationLink(value: selectedItem) {
          Text(verbatim: selectedItem)
            .navigationTitle(selectedItem)
        }
      } else {
        Text("Choose an item from the sidebar")
      }
    }
  }
}

#Preview {
  RootView()
}
