//
//  SearchView.swift
//  Photos
//

import SwiftUI

struct SearchView: View {
    // Variables
    @State private var searchText = String()
    @State private var showingInfo = false
    
    var body: some View {
        NavigationStack {
            EmptyView()
                .navigationTitle("Recents")
        }
        .overlay(alignment: .bottom) {
            HStack {
                Text("Some Results May Not Appear")
                
                Button {
                    showingInfo.toggle()
                } label: {
                    Image(systemName: "info.circle")
                }
                .mask(Circle().scaleEffect(0.7))
                .padding(.leading, -15)
                .popover(isPresented: $showingInfo) {
                    Text("Photos organizes photos and videos when Apple Vision Pro is locked and connected to Wi-Fi.")
                        .font(.footnote)
                        .padding(.horizontal)
                        .frame(maxWidth: 250, idealHeight: 100)
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
