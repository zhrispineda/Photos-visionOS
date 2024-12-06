//
//  CollectionsView.swift
//  Photos
//

import SwiftUI

struct CollectionsView: View {
    // Variables
    @State private var showingAccountView = false
    @State private var showingNewFeatures = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationStack {
                ScrollView {
                    HStack {
                        Text("Pinned Collections")
                            .font(.title)
                        Button("", systemImage: "chevron.right") {}
                            .clipShape(Circle())
                            .scaleEffect(0.75)
                            .padding(.leading, -10)
                        Spacer()
                    }
                    .padding([.top, .leading], 30)
                    
                    // Horizontal ScrollView for Pinned Collections
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: -30) {
                            CollectionsCell(icon: "heart.fill", label: "Favorites")
                            CollectionsCell(icon: "square.and.arrow.down.badge.clock.fill", label: "Recently Saved")
                            CollectionsCell(icon: "video.fill", label: "Videos")
                            CollectionsCell(icon: "camera.viewfinder", label: "Screenshots")
                            CollectionsCell(icon: "doc.text.fill", label: "Documents")
                            CollectionsCell(icon: "slider.horizontal.3", label: "Recently Edited")
                            CollectionsCell(icon: "eye.fill", label: "Recently Viewed")
                            CollectionsCell(icon: "square.and.arrow.down.fill", label: "Imports")
                        }
                    }
                    .ignoresSafeArea()
                    .padding([.top, .bottom], 30)
                    
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
                .navigationBarHidden(true)
                .background(Color(UIColor.systemBackground))
                .ignoresSafeArea()
                .onAppear {
                    showingNewFeatures.toggle()
                }
                .sheet(isPresented: $showingAccountView) {
                    NavigationStack {
                        AccountView()
                    }
                }
                .sheet(isPresented: $showingNewFeatures) {
                    OnBoardingView()
                        .frame(width: 700, height: 650)
                }
            }
            
            // MARK: Toolbar Buttons
            HStack {
                Button {} label: {
                    Label("Customize", systemImage: "arrow.swap")
                        .labelStyle(.iconOnly)
                }
                Button {
                    showingAccountView.toggle()
                } label: {
                    Label("Manage", systemImage: "person.fill")
                        .labelStyle(.iconOnly)
                }
            }
            .padding([.top, .trailing], 25)
        }
    }
}

// Square navigation links for Pinned Collections
struct CollectionsCell: View {
    var icon: String
    var label: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 225, height: 225)
                .foregroundStyle(Color(UIColor.systemFill))
                .padding(.horizontal, 30)
            
            VStack {
                Spacer()
                HStack {
                    Image(systemName: icon)
                    Text(label)
                }
                .fontWeight(.semibold)
                .font(.headline)
                .padding([.leading, .bottom], 15)
                .frame(width: 215, alignment: .leading)
            }
        }
    }
}

// Rectangle cells under categories with descriptive information
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
