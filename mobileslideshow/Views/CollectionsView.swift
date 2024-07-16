//
//  CollectionsView.swift
//  Photos
//

import SwiftUI

struct CollectionsView: View {
    // Variables
    @State private var showingAccountView = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Rectangle()
                    .frame(height: 500)
                    .foregroundStyle(Color(UIColor.systemBackground)) //(Color(UIColor.systemFill))
                HStack(spacing: 20) {
                    VStack(spacing: 30) { // Wider left side
                        CellView(header: "People & Pets", icon: "person.fill", subtitle: "Finding People...", description: "Photos organizes people and pets into albums. Remove your Apple Vision Pro and connect it to power to complete.")
                        CellView(header: "Memories", icon: "memories", subtitle: "No Memories Available", description: "Memories will appear here when more photos and videos are added to the library.")
                        CellView(header: "Trips", icon: "suitcase.fill", subtitle: "No Trips Available", description: "Trips will appear here when more photos and videos are added to the library.")
                        Spacer()
                    }
                    .frame(width: 700)
                    VStack(spacing: 30) { // Narrower right side
                        CellView(header: "Featured Spatial Photos", icon: "photo.fill", subtitle: "No Featured Photos Available", description: "Featured Photos will appear when more photos and videos are added to the library, or synced with iCloud.")
                        CellView(header: "Recent Days", icon: "clock.fill", subtitle: "No Days Available", description: "Days will appear here when more photos and videos are added to the library.")
                        Spacer()
                    }
                }
                .padding([.horizontal, .bottom], 30)
            }
            .background(Color(UIColor.systemBackground))
            .ignoresSafeArea()
            .sheet(isPresented: $showingAccountView) {
                NavigationStack {
                    AccountView()
                }
            }
            .toolbar {
                // MARK: Customize button
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Label("Customize", systemImage: "arrow.swap")
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

struct CellView: View {
    var header = String()
    var icon = String()
    var subtitle = String()
    var description = String()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
            ZStack {
                RoundedRectangle(cornerRadius: 30.0)
                    .foregroundStyle(Color(UIColor.systemFill))
                    .frame(height: 250)
                HStack {
                    VStack(alignment: .leading) {
                        Image(systemName: icon)
                            .foregroundStyle(.secondary)
                            .font(.system(size: 20))
                        Spacer()
                        Text(subtitle)
                            .foregroundStyle(.secondary)
                        Text(description)
                            .foregroundStyle(.tertiary)
                    }
                    Spacer()
                }
                .padding(30)
            }
        }
        .frame(maxWidth: .infinity)
        .fixedSize(horizontal: false, vertical: true) // Keep vertical layout fixed
    }
}

#Preview {
    CollectionsView()
}
