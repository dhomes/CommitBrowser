//
//  OCCommitViewModel.h
//  OCCommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import <Foundation/Foundation.h>
#import "OCCommit.h"
#import "OCFetchDirection.h"

#define kCOMMITS_VIEW_OBSERVABLE_PATH @"commits"

@protocol OCCommitsViewModel <NSObject>
@required
@property(nonatomic,readonly) NSArray<id<OCCommit>> *commits;
@property(nonatomic,readonly,assign) int numberOfRows;
@property(nonatomic,readonly,assign) BOOL hasCommits;
@property(nonatomic,readonly,assign) BOOL isFetching;
@property(nonatomic,readonly,assign) BOOL hasMore;
-(void)fetch:(OCFetchDirection)direction completion:(void (^)(NSError * error))block;
-(id<OCCommit>)commitAt:(NSIndexPath *)indexPath;
@end

