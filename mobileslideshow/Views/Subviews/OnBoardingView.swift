//
//  OnBoardingView.swift
//  mobileslideshow
//

import SwiftUI

struct OnBoardingView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Group {
                    Image("AppIcon/Back/Content").resizable()
                    Image("AppIcon/Middle/Content").resizable()
                    Image("AppIcon/Front/Content").resizable()
                }
            }
            .scaledToFit()
            .frame(width: 100)
            .clipShape(Circle())
            
            Text("COLLECTIONS_BUDDY_HEADER", tableName: "Photos")
                .font(.extraLargeTitle2)
            
            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 16) {
                GridRow(alignment: .top) {
                    Image(systemName: "spatial.capture")
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .frame(width: 64, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("COLLECTIONS_BUDDY_BULLETED_ITEM_ONE_TITLE", tableName: "Photos")
                            .fontWeight(.bold)
                        Text("COLLECTIONS_BUDDY_BULLETED_ITEM_ONE_BODY", tableName: "Photos")
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 490, alignment: .leading)
                }
                
                GridRow(alignment: .top) {
                    Image(systemName: "info.circle")
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .frame(width: 64, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("COLLECTIONS_BUDDY_BULLETED_ITEM_TWO_TITLE", tableName: "Photos")
                            .fontWeight(.bold)
                        Text("COLLECTIONS_BUDDY_BULLETED_ITEM_TWO_BODY", tableName: "Photos")
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 490, alignment: .leading)
                }
                
                GridRow(alignment: .top) {
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .frame(width: 64, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("COLLECTIONS_BUDDY_BULLETED_ITEM_THREE_TITLE", tableName: "Photos")
                            .fontWeight(.bold)
                        Text("COLLECTIONS_BUDDY_BULLETED_ITEM_THREE_BODY", tableName: "Photos")
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 490, alignment: .leading)
                }
            }
            
            Button {
                dismiss()
            } label: {
                Text("COLLECTIONS_BUDDY_DISMISS_BUTTON_LABEL", tableName: "Photos")
                    .font(.headline)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
            .buttonStyle(.plain)
            .padding(.vertical)
        }
    }
}

#Preview {
    NavigationStack {
        OnBoardingView()
    }
}
