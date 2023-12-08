//
//  ViewController.swift
//  SOL Ponto
//
//  Created by Anthony Silveira  on 22/11/23.
//

import UIKit

class ViewController: UIViewController {

    // Outlets para os campos de texto e botão
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configuração inicial
    }

    // Ação para o botão de login
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Verificação simples de login (nome de usuário: "usuario", senha: "senha")
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        if username == "usuario" && password == "senha" {
            // Se as credenciais estiverem corretas, exibir uma mensagem de sucesso (aqui você pode navegar para a próxima tela)
            showAlert(title: "Login bem-sucedido", message: "Bem-vindo!")
        } else {
            // Se as credenciais estiverem incorretas, exibir uma mensagem de erro
            showAlert(title: "Erro de login", message: "Credenciais inválidas. Tente novamente.")
        }
    }
    
    // Função para exibir um alerta
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
