//
//  PanoramaView.swift
//  Photos
//

import SwiftUI

struct PanoramaView: View {
    @State private var showingAccountView = false
    @State private var showingPopup = true
    @State private var selectedOption = "PXContentSortingMenuCompactDateAdded"
    private let path = "/System/Library/PrivateFrameworks/PhotosUICore.framework"
    private let table = "PhotosUICore"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("EMPTY_LIBRARY_TITLE_PANORAMA", tableName: "Photos")
                        .font(.title2)
                    Text("EMPTY_LIBRARY_MESSAGE_PANORAMA", tableName: "Photos")
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 280)
                .sheet(isPresented: $showingPopup) {
                    VStack {
                        HStack {
                            Spacer()
                            Button("Done") {
                                showingPopup.toggle()
                            }
                        }
                        
                        Text("PANO_BUDDY_HEADER", tableName: "Photos")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        ZStack {
                            Rectangle()
                            Image("PanoLandingImmerse")
                                .resizable()
                                .scaledToFill()
                            Button {} label: {
                                HStack {
                                    Image(_internalSystemName: "inset.filled.pano")
                                    Text("BUDDY_IMMERSE_BUTTON_LABEL", tableName: "Photos")
                                }
                            }
                        }
                        .frame(width: 500, height: 185)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Image(systemName: "iphone.rear.camera")
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .padding(.top)
                        Text("PANO_BUDDY_FOOTER", tableName: "Photos")
                            .padding(.bottom)
                            .font(.callout)
                    }
                    .padding()
                }
            }
            .navigationTitle("PICKER_TAB_TITLE_PANORAMAS".localized(path: path, table: table))
            .toolbar {
                // MARK: Sort button
                ToolbarItem(placement: .topBarTrailing) {
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
    PanoramaView()
}
