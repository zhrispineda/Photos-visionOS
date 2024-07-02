//
//  LibraryView.swift
//  Photos
//

import SwiftUI

struct LibraryView: View {
    // Variables
    @State private var selectedOption = "All Items"
    @State private var selectedRatioGrid = "Square"
    
    @State var selectedOptions: [String] = []
    struct FilterOption: Hashable, Identifiable {
        var id: String { name }
        var name: String
        var icon: String
    }
    
    let includeOptions: [FilterOption] = [
        .init(name: "All Items", icon: "photo.on.rectangle")
    ]
    
    let onlyShowOptions: [FilterOption] = [
        .init(name: "Favorites", icon: "heart"),
        .init(name: "Edited", icon: "slider.horizontal.3"),
        .init(name: "Photos", icon: "photo"),
        .init(name: "Videos", icon: "video")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text("No Photos or Videos")
                    .font(.title2)
                    .padding(.bottom, 50)
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
                    Menu {
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
                                Button {
                                    selectedRatioGrid = selectedRatioGrid == "Square" ? "Aspect" : "Square"
                                } label: {
                                    Label("\(selectedRatioGrid == "Square" ? "Aspect" : "Square") Ratio Grid", systemImage: selectedRatioGrid == "Square" ? "rectangle.compress.vertical" : "rectangle.expand.vertical")
                                }
                            }
                        }
                    } label: {
                        Label {} icon: {
                            Image(_internalSystemName: "arrow.trianglehead.up.arrow.trianglehead.down")
                        }
                    }
                }
                
                // MARK: Manage button
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Label("Manage", systemImage: "person.fill")
                    }
                }
            }
        }
        .ornament(attachmentAnchor: .scene(.bottomFront)) {
            HStack(spacing: 10) {
                Button("Years") {}
                    .disabled(true)
                Button("Months") {}
                    .disabled(true)
                Button("All") {}
            }
            .padding(5)
            .glassBackgroundEffect()
        }
    }
}

#Preview {
    ContentView()
}
