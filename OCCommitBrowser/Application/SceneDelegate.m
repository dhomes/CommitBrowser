//
//  SceneDelegate.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "SceneDelegate.h"
#import "CommitsRootsCoordinator.h"
@interface SceneDelegate ()
@property(nonatomic, weak) UIWindow *sceneWindow;
@property(nonatomic, strong) OCCoordinator *rootCoordinator;
@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    CGRect windowFrame = [windowScene coordinateSpace].bounds;
    
    UIWindow *appWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    [appWindow setWindowScene:windowScene];
    
    CommitsRootsCoordinator *rootCoordinator = [CommitsRootsCoordinator new];
    [rootCoordinator start];
    self.rootCoordinator = rootCoordinator;
    
    [appWindow setRootViewController:rootCoordinator.viewController];
    [appWindow makeKeyAndVisible];
    self.window = appWindow;
}


- (void)sceneDidDisconnect:(UIScene *)scene {
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
