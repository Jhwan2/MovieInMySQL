//
//  SceneDelegate.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/11/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var isLogged: Bool = false

    
//    func changeRootVC(_ vc:UIViewController, animated: Bool) {
//        guard let window = self.window else { return }
//        window.rootViewController = vc // 전환
//
//        UIView.transition(with: window, duration: 0.2, options: [.transitionCrossDissolve], animations: nil, completion: nil)
//      }
    
    func changeRootViewController (_ vc: UITabBarController, animated: Bool) {
        guard let window = self.window else { return }
        window.rootViewController = vc // 전환
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Main.storyboard 가져오기
                
                if isLogged == false {
                    // 로그인 안된 상태
                    guard let loginVC = storyboard.instantiateViewController(withIdentifier: "LogInView") as? LogInController else { return }
                    window?.rootViewController = loginVC
                } else {
                    // 로그인 된 상태
                    guard let mainVC = storyboard.instantiateViewController(withIdentifier: "MainView") as? UITabBarController else { return }
                    window?.rootViewController = mainVC
                }
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

