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
                
            }
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

#Preview {
    CollectionsView()
}
