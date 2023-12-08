//
//  SceneDelegate.swift
//  SOL Ponto
//
//  Created by Sósthenes Oliveira Lima on 02/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let loginViewController = LoginViewController()
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
    }

    // Restante do código do SceneDelegate conforme necessário...
}
