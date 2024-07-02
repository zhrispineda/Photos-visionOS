//
//  ContentView.swift
//  Photos
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Library", systemImage: "photo.fill.on.rectangle.fill") {
                LibraryView()
            }
            Tab("Collections", systemImage: "square.grid.2x2.fill") {
                CollectionsView()
            }
            Tab("Spatial", systemImage: "cube") {
                SpatialView()
            }
            Tab("Panoramas", systemImage: "pano.fill") {}
            Tab("Search", systemImage: "magnifyingglass") {}
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
