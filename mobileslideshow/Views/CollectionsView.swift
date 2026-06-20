//
//  CollectionsView.swift
//  Photos
//

import SwiftUI

struct CollectionsView: View {
    @State private var showingAccountView = false
    @State private var showingNewFeatures = false
    private let path = "/System/Library/PrivateFrameworks/PhotosUICore.framework"
    private let table = "PhotosUICore"
    private let lemonTable = "LemonadeLocalizable"
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationStack {
                ScrollView {
                    Spacer(minLength: 75)
                    
                    // Horizontal ScrollView for Pinned Collections
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: -30) {
                            CollectionsCell(
                                icon: "heart.fill",
                                label: "LemonadeFavoritesQuickAccessButtonTitle".localized(path: path, table: lemonTable)
                            )
                            CollectionsCell(
                                icon: "square.and.arrow.down.badge.clock.fill",
                                label: "PXCollectionRecentlySavedShortTitle".localized(path: path, table: lemonTable)
                            )
                            CollectionsCell(
                                icon: "video.fill",
                                label: "LemonadeDetailsViewVideosLens".localized(path: path, table: lemonTable)
                            )
                            CollectionsCell(
                                icon: "camera.viewfinder",
                                label: "LemonadeUtilitiesCategoryScreenshotsTitle".localized(path: path, table: lemonTable)
                            )
                            CollectionsCell(
                                icon: "doc.text.fill",
                                label: "LemonadeDocumentsQuickAccessButtonTitle".localized(path: path, table: lemonTable)
                            )
                            CollectionsCell(
                                icon: "slider.horizontal.3",
                                label: "PXCollectionRecentlyEditedTitle".localized(path: path, table: lemonTable)
                            )
                            CollectionsCell(
                                icon: "eye.fill",
                                label: "PXCollectionRecentlyViewedTitle".localized(path: path, table: lemonTable)
                            )
                            CollectionsCell(
                                icon: "square.and.arrow.down.fill",
                                label: "LemonadeUtilitiesCategoryImportsTitle".localized(path: path, table: lemonTable)
                            )
                        }
                    }
                    .ignoresSafeArea()
                    .padding([.top, .bottom], 30)
                    
                    HStack(spacing: 20) {
                        VStack(spacing: 30) { // Wider left side
                            CellView(
                                header: "PXPeopleTitle".localized(path: path, table: table),
                                icon: "person.fill",
                                subtitle: "PXPeopleUpdatingTitle".localized(path: path, table: table),
                                description: "PXPeopleUpdatingMessage".localized(path: path, table: table)
                            )
                            CellView(
                                header: "PXCollectionMemoriesTitle".localized(path: path, table: table),
                                icon: "memories",
                                subtitle: "PXEmptyMemoriesTitle".localized(path: path, table: table),
                                description: "PXEmptyMemoriesMessage".localized(path: path, table: table)
                            )
                            CellView(
                                header: "LemonadeSearchResultCollectionsGroupTrips".localized(path: path, table: lemonTable),
                                icon: "suitcase.fill",
                                subtitle: "LemonadeEmptyTripsTitle".localized(path: path, table: lemonTable),
                                description: "LemonadeEmptyTripsMessage".localized(path: path, table: lemonTable)
                            )
                            Spacer()
                        }
                        .frame(width: 700)
                        
                        VStack(spacing: 30) { // Narrower right side
                            CellView(
                                header: "LemonadeFeaturedPhotosSectionHeaderTitleSpatial".localized(path: path, table: lemonTable),
                                icon: "photo.fill",
                                subtitle: "LemonadeEmptyFeaturedSpatialPhotosTitle".localized(path: path, table: lemonTable),
                                description: "LemonadeEmptyFeaturedSpatialPhotosMessage".localized(path: path, table: lemonTable)
                            )
                            CellView(
                                header: "LemonadeEventsFeatureShelfTitle".localized(path: path, table: lemonTable),
                                icon: "clock.fill",
                                subtitle: "LemonadeEmptyDaysTitle".localized(path: path, table: lemonTable),
                                description: "LemonadeEmptyDaysMessage".localized(path: path, table: lemonTable)
                            )
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
                    Label("Customize", systemImage: "ellipsis")
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
