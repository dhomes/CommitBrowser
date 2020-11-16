//
//  CommitsRootsCoordinator.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "CommitsRootsCoordinator.h"
#import "OCCommitsRootController.h"
#import "OCGithubCommitsViewModel.h"
#import "OCGitHubNetworking.h"
#import "OCRepository.h"

@implementation CommitsRootsCoordinator

-(void)start {
    OCGitHubNetworking *networkService = [OCGitHubNetworking new];
    OCRepository *repo = [OCRepository defaultRepository];
    OCGithubCommitsViewModel *viewModel = [[OCGithubCommitsViewModel alloc] initWithService:networkService repository:repo pageSize:@10];
    
    OCCommitsRootController *controller = [[OCCommitsRootController alloc] init];
    controller.model = viewModel;
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
    self.viewController = navigation;
}

@end
