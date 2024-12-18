//
//  SpatialView.swift
//  Photos
//

import SwiftUI

struct SpatialView: View {
    // Variables
    @State private var selectedOption = "All Items"
    @State private var showingAccountView = false
    @State private var showingPopup = true
    
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
            ScrollView {
                VStack {
                    Text("No Spatial Photos or Videos")
                        .font(.title2)
                    Text("You can take spatial photos and videos by pressing the top button, or opening Capture.")
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 280)
            }
            .navigationTitle("Spatial")
            .sheet(isPresented: $showingPopup) {
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Button("Done") {
                            showingPopup.toggle()
                        }
                    }
                    
                    Text("Immerse in Spatial Photos and Videos")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)
                        .frame(height: 75)
                    
                    ZStack {
                        Rectangle()
                        Image("SpatialLandingImmersive")
                            .resizable()
                            .scaledToFill()
                        Button {} label: {
                            HStack {
                                Image(_internalSystemName: "inset.filled.pano")
                                Text("Try Immersive")
                            }
                        }
                        .offset(y: 130)
                    }
                    .frame(width: 350, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Image(systemName: "button.horizontal.top.press")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .padding(.top)
                    Text("Press the top button to start capturing")
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .font(.callout)
                }
                .padding()
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
                        }
                    } label: {
                        Label {
                            Text("Sort")
                        } icon: {
                            Image(_internalSystemName: "arrow.trianglehead.up.arrow.trianglehead.down")
                        }
                    }
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
    }
}

#Preview {
    SpatialView()
}
