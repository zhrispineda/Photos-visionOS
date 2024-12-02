//
//  AccountView.swift
//  Photos
//

import SwiftUI

struct AccountView: View {
    // Variables
    @Environment(\.dismiss) private var dismiss
    @AppStorage("ShowHiddenAlbum") private var showHiddenAlbum = true
    @AppStorage("AutoPlayMedia") private var autoPlayVideosLivePhotos = true
    @AppStorage("ViewHDR") private var viewFullHDR = true
    @AppStorage("ShowFeaturedContent") private var showFeaturedContent = true
    @AppStorage("ShowHolidayEvents") private var showHolidayEvents = true
    
    var body: some View {
        List {
            Section {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 80))
                    Text("No Items")
                        .bold()
                        .padding(.top, 1)
                }
            }
            .frame(maxWidth: .infinity)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            Section("Show in Main View") {
                Toggle("Hidden Album", isOn: $showHiddenAlbum)
            }
            
            Section {
                Toggle("Auto-Play Videos and Live Photos", isOn: $autoPlayVideosLivePhotos)
                Toggle("View Full HDR", isOn: $viewFullHDR)
            } header: {
                Text("View Options")
            } footer: {
                Text("Automatically adjust the display to show the complete dynamic range of photos (HDR).")
            }
            
            Section {
                Toggle("Show Featured Content", isOn: $showFeaturedContent)
            } header: {
                Text("Featured")
            } footer: {
                Text("Allow Featured Photos and Memories to automatically appear on this device.")
            }
            
            Section {
                Toggle("Show Holiday Events", isOn: $showHolidayEvents)
            } footer: {
                Text("You can choose to see timely holiday events and those for your home country or region.")
            }
            
            Section {
                Button("Reset Suggested Memories") {}
                Button("Reset People & Pets Suggestions") {}
            } footer: {
                Text("If you choose to Feature Less of certain Memories or People, you can reset in order for them to be suggested again.")
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("Close", systemImage: "xmark")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AccountView()
    }
}
