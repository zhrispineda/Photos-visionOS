//
//  LibraryView.swift
//  Photos
//

import SwiftUI

struct LibraryView: View {
    @State private var showingAccountView = false
    @State private var selectedOption = "All Items"
    @State private var selectedRatioGrid = "Square"
    @State private var selectedShowOptions = "Screenshots"
    let includeOptions: [FilterOption] = [
        .init(name: "All Items", icon: "photo.on.rectangle")
    ]
    let onlyShowOptions: [FilterOption] = [
        .init(name: "Favorites", icon: "heart"),
        .init(name: "Edited", icon: "slider.horizontal.3"),
        .init(name: "Photos", icon: "photo"),
        .init(name: "Videos", icon: "video")
    ]
    let viewOptions: [FilterOption] = [
        .init(name: "Screenshots", icon: "camera.viewfinder")
    ]
    private let path = "/System/Library/PrivateFrameworks/PhotosUICore.framework"
    private let table = "PhotosUICore"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text("PXLibraryEmptyTitle".localized(path: path, table: table))
                    .font(.title2)
                    .padding(.bottom, 50)
            }
            .sheet(isPresented: $showingAccountView) {
                NavigationStack {
                    AccountView()
                }
            }
            .toolbar {
                if selectedOption != "All Items" {
                    // MARK: Filter button
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Section {
                                Picker("Include", selection: $selectedOption) {
                                    ForEach(includeOptions) { option in
                                        HStack {
                                            Text(option.name)
                                            Spacer()
                                            Image(systemName: option.icon)
                                        }
                                    }
                                }
                                .labelsVisibility(.visible)
                            }
                            
                            Section {
                                Picker("Only Show", selection: $selectedOption) {
                                    ForEach(onlyShowOptions) { option in
                                        HStack {
                                            Text(option.name)
                                            Spacer()
                                            Image(systemName: option.icon)
                                        }
                                    }
                                }
                                .labelsVisibility(.visible)
                            } header: {
                                Text("Only Show")
                            }
                        } label: {
                            Label {} icon: {
                                Image(systemName: "line.3.horizontal.decrease")
                            }
                        }
                    }
                }
                
                // MARK: Sort button
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort", systemImage: "ellipsis") {
                        Section {
                            Button("Sort by Recently Added") {}
                            Button("Sort by Date Added") {}
                        }
                        
                        Section {
                            Menu {
                                Section {
                                    Picker("Include", selection: $selectedOption) {
                                        ForEach(includeOptions) { option in
                                            HStack {
                                                Text(option.name)
                                                Spacer()
                                                Image(systemName: option.icon)
                                            }
                                        }
                                    }
                                    .labelsVisibility(.visible)
                                }
                                
                                Section {
                                    Picker("Only Show", selection: $selectedOption) {
                                        ForEach(onlyShowOptions) { option in
                                            HStack {
                                                Text(option.name)
                                                Spacer()
                                                Image(systemName: option.icon)
                                            }
                                        }
                                    }
                                    .labelsVisibility(.visible)
                                } header: {
                                    Text("Only Show")
                                }
                            } label: {
                                Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                            }
                            
                            Menu("View Options") {
                                Section {
                                    Button {
                                        selectedRatioGrid = selectedRatioGrid == "Square" ? "Aspect" : "Square"
                                    } label: {
                                        Label("\(selectedRatioGrid == "Square" ? "Aspect" : "Square") Ratio Grid", systemImage: selectedRatioGrid == "Square" ? "rectangle.compress.vertical" : "rectangle.expand.vertical")
                                    }
                                }
                                
                                Section {
                                    Picker("Show:", selection: $selectedShowOptions) {
                                        ForEach(viewOptions) { option in
                                            Button(option.name, systemImage: option.icon) {}
                                        }
                                    }
                                    .labelsVisibility(.visible)
                                }
                            }
                        }
                    }
                    .menuStyle(.borderlessButton)
                }
                
                // MARK: Manage button
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAccountView.toggle()
                    } label: {
                        Label("Manage", systemImage: "person.fill")
                    }
                }
            }
        }
        .ornament(attachmentAnchor: .scene(.bottomFront)) {
            HStack(spacing: 10) {
                Button("PXCuratedLibraryYearsZoomLevelButtonTitle".localized(path: path, table: table)) {}
                    .disabled(true)
                Button("PXCuratedLibraryMonthsZoomLevelButtonTitle".localized(path: path, table: table)) {}
                    .disabled(true)
                Button("PXCuratedLibraryAllPhotosZoomLevelButtonShortTitle".localized(path: path, table: table)) {}
            }
            .padding(5)
            .glassBackgroundEffect()
        }
    }
}

struct FilterOption: Hashable, Identifiable {
    var id: String { name }
    var name: String
    var icon: String
}

#Preview {
    ContentView()
}
