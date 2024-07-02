//
//  SpatialView.swift
//  Photos
//

import SwiftUI

struct SpatialView: View {
    // Variables
    @State private var showingAccountView = false
    
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
            .toolbar {
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
