//
//  OCGithubCommitsViewModel.h
//  OCCommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import <Foundation/Foundation.h>
#import "OCCommitViewModel.h"
#import "OCCommit.h"
#import "OCNetworking.h"
#import "OCRepository.h"

@interface OCGithubCommitsViewModel : NSObject<OCCommitsViewModel>
-(instancetype)initWithService:(id<OCNetworking>)networking
                    repository:(OCRepository *)repository
                      pageSize:(NSNumber *)pageSize;
@end
