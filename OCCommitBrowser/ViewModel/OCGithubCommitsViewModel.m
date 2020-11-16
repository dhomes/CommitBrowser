//
//  OCGithubCommitsViewModel.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import "OCGithubCommitsViewModel.h"
#import <UIKit/UIKit.h>
#import "OCQuery.h"

@interface OCGithubCommitsViewModel ()
@property(nonatomic,strong) NSArray<id<OCCommit>> *commits;
@property(nonatomic,assign) int numberOfRows;
@property(nonatomic,assign) BOOL hasCommits;
@property(nonatomic,assign) BOOL isFetching;
@property(nonatomic,strong) id<OCNetworking> networkService;
@property(nonatomic,strong) OCRepository *repository;
@property(nonatomic,copy) NSNumber *pagesize;
@property(nonatomic,assign) BOOL hasMore;
@end

@implementation OCGithubCommitsViewModel

@synthesize commits;
@synthesize hasCommits;
@synthesize isFetching;
@synthesize numberOfRows;

- (id<OCCommit>)commitAt:(NSIndexPath *)indexPath {
    return [commits objectAtIndex:[indexPath row]];
}

-(instancetype)initWithService:(id<OCNetworking>)networking
                    repository:(OCRepository *)repository
                      pageSize:(NSNumber *)pageSize {
    
    self = [super init];
    if(self) {
        self.networkService = networking;
        self.repository = repository;
        self.pagesize = pageSize;
        self.commits = [NSMutableArray new];
        self.isFetching = false;
    }
    return self;
}

-(int)numberOfRows {
    return (int)[commits count];
}

-(BOOL)hasCommits {
    return ([commits count] > 0);
}

-(void)fetch:(OCFetchDirection)direction
  completion:(void (^)(NSError * error))completion {
    
    NSDate *below = nil;
    
    if (direction == kFetchDirectionBottom) {
        below = [[commits lastObject].date dateByAddingTimeInterval:-0.1];
    }
    
    self.hasMore = (direction == kFetchDirectionTop) ? YES : _hasMore;
    if (!self.hasMore || self.isFetching) {
        isFetching = NO;
        completion(nil);
        return;
    }
    OCQuery *query = [[OCQuery alloc] initWithPageSize:self.pagesize below:below];
    self.isFetching = YES;
    
    __weak __typeof__(self) weakSelf = self;
    [self.networkService fetchCommitsFor:self.repository
                                   query:query
                              completion:^(NSArray<id<OCCommit>> * fetchedCommits, NSError * error) {
        if(error) {
            completion(error);
        } else {
            if (direction == kFetchDirectionTop) {
                weakSelf.commits = fetchedCommits;
            } else {
                weakSelf.commits = [weakSelf.commits arrayByAddingObjectsFromArray:fetchedCommits];
            }
            BOOL more = [fetchedCommits count] >= [query.pagesize intValue];
            weakSelf.hasMore = more;
            completion(nil);
        }
        weakSelf.isFetching = NO;
    }];
}
@end
