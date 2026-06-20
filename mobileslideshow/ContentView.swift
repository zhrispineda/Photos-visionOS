//
//  ContentView.swift
//  Photos
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    private let path = "/System/Library/PrivateFrameworks/PhotosUICore.framework"
    private let table = "PhotosUICore"
    
    var body: some View {
        TabView {
            Tab(LocalizedStringResource("LIBRARY_TAB_TITLE", table: "Photos"), systemImage: "photo.fill.on.rectangle.fill") {
                LibraryView()
            }
            Tab("LemonadeBookmarksPickerTitle".localized(path: path, table: "LemonadeLocalizable"), systemImage: "square.grid.2x2.fill") {
                CollectionsView()
            }
            Tab(LocalizedStringResource("SPATIAL_TAB_TITLE", table: "Photos"), systemImage: "cube") {
                SpatialView()
            }
            Tab("PICKER_TAB_TITLE_PANORAMAS".localized(path: path, table: table), systemImage: "pano.fill") {
                PanoramaView()
            }
            Tab("PHOTOS_DETAILS_SEARCH_PLACEHOLDER".localized(path: path, table: table), systemImage: "magnifyingglass") {
                SearchView()
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
