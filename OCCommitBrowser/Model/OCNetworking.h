//
//  OCNetworking.h
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import <Foundation/Foundation.h>
#import "OCCommit.h"
#import "OCGithubCommit.h"
typedef void (^CommitBlock)(NSArray<id<OCCommit>> * _Nullable ,NSError * _Nullable);

@interface OCNetworking : NSObject
-(void)fetchCommits:(CommitBlock _Nullable )completion;
@end
