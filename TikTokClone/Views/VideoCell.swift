import UIKit

class VideoCell: UICollectionViewCell {
  let videoPlayerView = VideoPlayerView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    contentView.addSubview(videoPlayerView)
    videoPlayerView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      videoPlayerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      videoPlayerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      videoPlayerView.topAnchor.constraint(equalTo: contentView.topAnchor),
      videoPlayerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func configure(with video: Video) {
    if let url = URL(string: video.videoUrl) {
      videoPlayerView.configure(with: url)
    }
  }
}
