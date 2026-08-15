//
//  VideoBackgroundView.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//

import SwiftUI
import AVKit

// Reusable video background view
struct VideoBackgroundView: UIViewRepresentable {

    // Name of the mp4 video file
    let videoName: String

    // Creates the UIKit video view
    func makeUIView(context: Context) -> UIView {

        let view = UIView()

        // Finds the video file in the app bundle
        guard let path = Bundle.main.path(forResource: videoName, ofType: "mp4") else {
            return view
        }

        // Creates the video player
        let player = AVPlayer(url: URL(fileURLWithPath: path))

        // Creates the video layer
        let playerLayer = AVPlayerLayer(player: player)

        // Makes video fill the screen
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = UIScreen.main.bounds

        // Adds the video layer to the view
        view.layer.addSublayer(playerLayer)

        // Loops the video when it ends
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in

            player.seek(to: .zero)
            player.play()
        }

        // Starts playing video
        player.play()

        return view
    }

    // Required update function
    func updateUIView(_ uiView: UIView, context: Context) {

    }
}
