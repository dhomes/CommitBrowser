//
//  OCNetworking.h
//  CommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import "OCCommit.h"
#import "OCRepository.h"
#import "OCQuery.h"
#import "OCFetchDirection.h"
typedef void (^CommitBlock)(NSArray<id<OCCommit>> * _Nullable ,NSError * _Nullable);

@protocol OCNetworking <NSObject>
@required
-(void)fetchCommitsFor:(OCRepository *_Nonnull)repository query:(OCQuery * _Nullable)query completion: (CommitBlock _Nullable )completion;
@end
