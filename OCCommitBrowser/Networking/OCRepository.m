//
//  OCRepository.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import "OCRepository.h"

static NSString *const kDefaultOwner = @"dhomes";
static NSString *const kDefaultRepository = @"commitbrowser";

@implementation OCRepository
+(instancetype)defaultRepository {
    return [[OCRepository alloc] initWithRepository:kDefaultRepository owner:kDefaultOwner];
}

-(instancetype)initWithRepository:(NSString *)repositoryName owner:(NSString *)owner {
    self = [super init];
    if (self) {
        self.owner = owner;
        self.reposityName = repositoryName;
    }
    return self;
}

-(NSString *)baseUrlString {
    return [NSString stringWithFormat:@"https://api.github.com/repos/%@/%@/commits",self.owner,self.reposityName];
}
@end
