import FirebaseAuth

class AuthService {
  static let shared = AuthService()
  
  func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if error != nil {
        completion(false)
        return
      }
      completion(true)
    }
  }
  
  func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if error != nil {
        completion(false)
        return
      }
      completion(true)
    }
  }
}
