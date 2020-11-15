//
//  CommitsRootsCoordinator.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "CommitsRootsCoordinator.h"
#import "OCCommitsRootController.h"

@implementation CommitsRootsCoordinator

-(void)start {
    OCCommitsRootController *controller = [[OCCommitsRootController alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
    self.viewController = navigation;
}

@end
