//
//  LibraryView.swift
//  Photos
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Text("No Photos or Videos")
                    .font(.title2)
                    .padding(.bottom, 50)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Sort by Recently Added") {}
                        Button("Sort by Date Added") {}
                    } label: {
                        Label {
                            Text("Sort")
                        } icon: {
                            Image(_internalSystemName: "arrow.trianglehead.up.arrow.trianglehead.down")
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Label("Account", systemImage: "person.fill")
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
