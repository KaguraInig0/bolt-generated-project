import UIKit
import FirebaseFirestore

class VideoFeedViewController: UIViewController {
  private var videos: [Video] = []
  private let db = Firestore.firestore()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchVideos()
  }
  
  private func fetchVideos() {
    db.collection("videos").getDocuments { snapshot, error in
      guard let documents = snapshot?.documents else { return }
      self.videos = documents.compactMap { document in
        let data = document.data()
        return Video(
          id: document.documentID,
          videoUrl: data["videoUrl"] as? String ?? "",
          thumbnailUrl: data["thumbnailUrl"] as? String ?? "",
          likes: data["likes"] as? Int ?? 0
        )
      }
    }
  }
}
