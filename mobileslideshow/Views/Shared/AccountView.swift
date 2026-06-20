//
//  AccountView.swift
//  Photos
//

import SwiftUI

struct AccountView: View {
    @AppStorage("AutoPlayMedia") private var autoPlayVideosLivePhotos = true
    @AppStorage("LoopVideos") private var loopVideos = true
    @AppStorage("ViewHDR") private var viewFullHDR = true
    @AppStorage("ShowFeaturedContent") private var showFeaturedContent = true
    @AppStorage("ShowHolidayEvents") private var showHolidayEvents = true
    @Environment(\.dismiss) private var dismiss
    private let path = "/System/Library/PrivateFrameworks/PhotosUICore.framework"
    private let table = "LemonadeLocalizable"
    
    var body: some View {
        List {
            Section {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 80))
                    Text("No Items")
                        .bold()
                        .padding(.top, 1)
                }
            }
            .frame(maxWidth: .infinity)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            Section("LemonadeSettingTurboSyncSectionTitle".localized(path: path, table: table)) {
                NavigationLink {} label: {
                    LabeledContent {
                        Text("LemonadeSettingTurboSyncOff".localized(path: path, table: table)).foregroundStyle(.tertiary)
                    } label: {
                        Text("LemonadeSettingTurboSyncTitle".localized(path: path, table: table))
                    }
                }
            }
            
            Section {
                Toggle("LemonadeSettingAutoplayTitle".localized(path: path, table: table), isOn: $autoPlayVideosLivePhotos)
                Toggle("LemonadeSettingAutoloopVideoTitle".localized(path: path, table: table), isOn: $loopVideos)
                Toggle("LemonadeSettingViewFullHDRTitle".localized(path: path, table: table), isOn: $viewFullHDR)
            } header: {
                Text("View Options".localized(path: path, table: table))
            } footer: {
                Text("LemonadeSettingViewFullHDRDescription".localized(path: path, table: table))
            }
            
            Section {
                Toggle("LemonadeSettingShowFeaturedContentTitle".localized(path: path, table: table), isOn: $showFeaturedContent)
            } header: {
                Text("LemonadeSettingFeaturedSectionTitle".localized(path: path, table: table))
            } footer: {
                Text("LemonadeSettingShowFeaturedContentDescription".localized(path: path, table: table))
            }
            
            Section {
                Toggle(
                    "LemonadeSettingShowHolidayEventsTitle".localized(path: path, table: table),
                    isOn: $showHolidayEvents)
            } footer: {
                Text(
                    "LemonadeSettingShowHolidayEventsDescription".localized(path: path, table: table)
                )
            }
            
            Section {
                Button("LemonadeSettingResetSuggestedMemoriesButtonTitle".localized(
                    path: path,
                    table: table)) {}
                Button("LemonadeSettingResetPeopleSuggestionsButtonTitle".localized(
                    path: path, table: table)) {}
            } footer: {
                Text("LemonadeSettingResetDescription".localized(
                    path: path, table: table)
                )
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("Close", systemImage: "xmark")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AccountView()
    }
}
