import AVKit
import UIKit

class VideoPlayerView: UIView {
  private var player: AVPlayer?
  private var playerLayer: AVPlayerLayer?
  
  func configure(with url: URL) {
    player = AVPlayer(url: url)
    playerLayer = AVPlayerLayer(player: player)
    playerLayer?.frame = bounds
    playerLayer?.videoGravity = .resizeAspectFill
    layer.addSublayer(playerLayer!)
    player?.play()
  }
}
