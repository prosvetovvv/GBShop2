

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let requestFactory = RequestFactory(sessionQueue: AppConfig.sessionQueue, baseUrl: AppConfig.baseUrl)
        let basketRequestFactory = requestFactory.makeBasketRequestFactory()
        let productRequestFactory = requestFactory.makeProductRequestFactory()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = TabBarVC(basketRequestFactory: basketRequestFactory, productRequestFactory: productRequestFactory)
        window?.makeKeyAndVisible()
    }
}

