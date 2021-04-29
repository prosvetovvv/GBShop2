

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let requestFactory = RequestFactory(sessionQueue: AppConfig.sessionQueue, baseUrl: AppConfig.baseUrl)
        let basketRequestFactory = requestFactory.makeBasketRequestFactory()
        
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = TabBarVC(basketRequestFactory: basketRequestFactory)
        //window?.rootViewController = LoginVC()
        window?.makeKeyAndVisible()
        
        //CoreDataStack.shared.applicationDocumentsDirectory()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}

