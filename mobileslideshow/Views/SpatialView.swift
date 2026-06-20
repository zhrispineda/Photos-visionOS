//
//  SpatialView.swift
//  Photos
//

import SwiftUI

struct SpatialView: View {
    @State private var selectedOption = "PXContentSortingMenuCompactDateAdded"
    @State private var showingAccountView = false
    @State private var showingPopup = true
    
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
                    
                    Text("SPATIAL_BUDDY_HEADER", tableName: "Photos")
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
                                Image(systemName: "inset.filled.pano")
                                Text("BUDDY_IMMERSE_BUTTON_LABEL", tableName: "Photos")
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
                    Text("SPATIAL_BUDDY_FOOTER", tableName: "Photos")
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .font(.callout)
                }
                .padding()
            }
            .toolbar {
                // MARK: Sort button
                ToolbarItem(placement: .topBarTrailing) {
                    VStack {
                        Menu {
                            Picker("", selection: $selectedOption) {
                                Image(systemName: "clock").tag("PXContentSortingMenuCompactDateAdded")
                                Image(systemName: "camera").tag("PXContentSortingMenuCompactDateCaptured")
                            }
                            .labelsHidden()
                            .pickerStyle(.segmented)
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                        .buttonBorderShape(.circle)
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
