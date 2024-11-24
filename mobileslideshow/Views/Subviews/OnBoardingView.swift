//
//  OnBoardingView.swift
//  mobileslideshow
//

import SwiftUI

struct OnBoardingView: View {
    // Variables
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Image("Photos")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape(Circle())
            Text("What's New in Photos")
                .font(.extraLargeTitle2)
            HStack {
                Image(_internalSystemName: "apple.photos")
                    .font(.largeTitle)
                    .frame(width: 80)
                VStack(alignment: .leading) {
                    Text("All New Photos App")
                        .fontWeight(.bold)
                    Text("Customize your library with a new dynamic layout and choose the look that works for you.")
                        .foregroundStyle(.secondary)
                }
                .frame(width: 490)
            }
            HStack {
                Image(systemName: "shareplay")
                    .font(.largeTitle)
                    .frame(width: 80)
                VStack(alignment: .leading) {
                    Text("SharePlay for Photos")
                        .fontWeight(.bold)
                    Text("Use SharePlay to view photos, spatial videos, and immersive panoramas together with others on Apple Vision Pro.")
                        .foregroundStyle(.secondary)
                }
                .frame(width: 490)
            }
            HStack {
                Image(_internalSystemName: "spatial")
                    .font(.largeTitle)
                    .frame(width: 80)
                VStack(alignment: .leading) {
                    Text("Create Spatial Photos")
                        .fontWeight(.bold)
                    Text("Take your existing photos and transform them into spatial, bringing moments to life with new depth and dimension.")
                        .foregroundStyle(.secondary)
                }
                .frame(width: 490)
            }
            Text("Creating spatial photos works best for sharp photos of uncrowded scenes with even lighting and the subject at a medium distance.")
                .foregroundStyle(.secondary)
                .font(.footnote)
                .frame(width: 525, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.top)
            Button {
                dismiss()
            } label: {
                Text("Continue")
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
