//
//  SearchView.swift
//  Photos
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var showingInfo = false
    private let path = "/System/Library/PrivateFrameworks/PhotosUICore.framework"
    private let table = "PhotosUICore"
    private let lemonTable = "LemonadeLocalizable"
    
    var body: some View {
        NavigationStack {
            List {}
                .navigationTitle("SEARCH_SUGGESTION_RECENTS_SECTION_TITLE".localized(path: path, table: table))
                .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
        }
        .overlay(alignment: .bottom) {
            HStack {
                Text("LemonadeProcessingAvailabilitySearch".localized(path: path, table: lemonTable))
                
                Button {
                    showingInfo.toggle()
                } label: {
                    Image(systemName: "info")
                }
                .mask(Circle())
                .popover(isPresented: $showingInfo) {
                    Text("LemonadeSocialGroupsEmptyMessage".localized(path: path, table: lemonTable))
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
