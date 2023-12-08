import UIKit

class LoginViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sqlponto.png"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome de usuário"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty else {
            showAlert(message: "Por favor, insira seu nome de usuário.")
            return
        }

        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Por favor, insira sua senha.")
            return
        }

        if username == "Anthony" && password == "123" {
            showMainScreen()
        } else {
            showAlert(message: "Credenciais inválidas. Tente novamente.")
        }
    }

    private func showAlert(message: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }


    private func showMainScreen() {
        let homeTabItem = UITabBarItem()
        homeTabItem.title = "Inicio"
        // Adicione a imagem desejada para o ícone do início
        homeTabItem.image = UIImage(named: "icon-home")

        let homeController = HomeViewController()
        homeController.tabBarItem = homeTabItem
        
        let reciboTabItem = UITabBarItem()
        reciboTabItem.title = "Recibos"
        // Adicione a imagem desejada para o ícone de recibos
        reciboTabItem.image = UIImage(named: "icon-recept")
        
        let reciboController = ReciboViewController()
        reciboController.tabBarItem = reciboTabItem
        
//        let perfilTabItem = UITabBarItem()
//        perfilTabItem.title = "Perfil"
//        perfilTabItem.image = UIImage(named: "icon-profile")
//
//        let perfilController = PerfilViewController()
//        perfilController.tabBarItem = perfilTabItem
//
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeController, reciboController]
        tabBarController.selectedViewController = homeController
        
        UIApplication.shared.windows.first?.rootViewController = tabBarController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
