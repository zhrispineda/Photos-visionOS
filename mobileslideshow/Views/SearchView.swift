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
        }
        .popover(isPresented: $showingInfo) {
            Text("Photos analyzes your library to provide more accurate search results.")
                .padding(.horizontal)
        }
        .overlay(alignment: .bottom) {
            HStack {
                Text("Indexing Your Library...")
                Button {
                    showingInfo.toggle()
                } label: {
                    Image(systemName: "info.circle")
                }
                .mask(Circle().scaleEffect(0.7))
                .padding(.leading, -15)
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
