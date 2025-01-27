import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
  private let emailTextField = UITextField()
  private let passwordTextField = UITextField()
  private let loginButton = UIButton()
  private let registerButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  private func setupViews() {
    view.backgroundColor = .black
    
    // Configure text fields
    emailTextField.placeholder = "Email"
    emailTextField.keyboardType = .emailAddress
    emailTextField.autocapitalizationType = .none
    emailTextField.backgroundColor = .white
    emailTextField.textColor = .black
    
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    passwordTextField.backgroundColor = .white
    passwordTextField.textColor = .black
    
    // Configure buttons
    loginButton.setTitle("Login", for: .normal)
    loginButton.backgroundColor = .systemBlue
    loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    
    registerButton.setTitle("Register", for: .normal)
    registerButton.backgroundColor = .systemGreen
    registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    
    // Add subviews
    let stackView = UIStackView(arrangedSubviews: [
      emailTextField,
      passwordTextField,
      loginButton,
      registerButton
    ])
    stackView.axis = .vertical
    stackView.spacing = 16
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(stackView)
    
    // Add constraints
    NSLayoutConstraint.activate([
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
    ])
  }
  
  @objc private func handleLogin() {
    guard let email = emailTextField.text, 
          let password = passwordTextField.text else { return }
    
    AuthService.shared.login(email: email, password: password) { success in
      if success {
        self.dismiss(animated: true)
      } else {
        self.showError(message: "Login failed")
      }
    }
  }
  
  @objc private func handleRegister() {
    guard let email = emailTextField.text, 
          let password = passwordTextField.text else { return }
    
    AuthService.shared.register(email: email, password: password) { success in
      if success {
        self.dismiss(animated: true)
      } else {
        self.showError(message: "Registration failed")
      }
    }
  }
  
  private func showError(message: String) {
    let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    present(alert, animated: true)
  }
}
