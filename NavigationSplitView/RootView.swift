//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by Tim Mitra on 2024-05-09.
//

import SwiftUI

struct RootView: View {
    var body: some View {
      // two column
        NavigationSplitView {
            // side bar
        } detail: {
           // item details
        }
    }
}

#Preview {
    RootView()
}
