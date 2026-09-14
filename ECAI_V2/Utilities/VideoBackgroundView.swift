//
//  VideoBackgroundView.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
import AVKit
// Creates a reusable video  background for E.C.A.I. screens.
struct VideoBackgroundView: UIViewRepresentable {
    // Stores the name of the mp4 video file.
    let videoName: String
    // Creates the UIKit view used to display the video.
    func makeUIView(context: Context) -> UIView {
        // Creates the view that holds the video layer.
        let view = UIView()
        // Finds the video file  inside the application bundle.
        guard let path = Bundle.main.path(
            forResource: videoName,
            ofType: "mp4"
        ) else {
            return view
        }
        // Creates the video player.
        let player = AVPlayer(
            url: URL(fileURLWithPath: path)
        )
        // Creates the layer used to display the video.
        let playerLayer = AVPlayerLayer(player: player)
        // Makes the video fill the available screen.
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = UIScreen.main.bounds
        // Adds the video layer to the view.
        view.layer.addSublayer(playerLayer)
        // Restarts the video when it reaches the end.
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }
        // Starts playing the video.
        player.play()
        return view
    }
    // Keeps the UIKit video view connected to SwiftUI.
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
