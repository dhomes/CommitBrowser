//
//  AppDelegate.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "AppDelegate.h"
#import "OCCommitAppearance.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self theme:[OCCommitAppearance new]];
    return YES;
}

- (void)theme:(id<OCAppearance>)appearance {
    UINavigationBarAppearance *barAppearance = [UINavigationBarAppearance new];
    [barAppearance configureWithOpaqueBackground];
    [barAppearance setBackgroundColor:[appearance navigationBarBackgroundColor]];
    
    
    UIColor *titleTextColor = [appearance navigationTitleTextColor];
    [barAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName : titleTextColor}];
    [barAppearance setLargeTitleTextAttributes:@{NSForegroundColorAttributeName : titleTextColor}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setStandardAppearance:barAppearance];
    [[UINavigationBar appearance] setScrollEdgeAppearance:barAppearance];
    
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
}


@end
