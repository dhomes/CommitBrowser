//
//  OCQuery.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import "OCQuery.h"

@implementation OCQuery
+(instancetype)defaultQuery {
    return [[OCQuery alloc] initWithPageSize:@10 below:nil];
}

-(instancetype)initWithPageSize:(NSNumber *)pagesize
                          below:(NSDate *)date {
    
    self = [super init];
    if (self) {
        self.pagesize = pagesize;
        self.below = date;
    }
    return self;

}

-(NSDictionary *)queryParameters; {
    NSMutableDictionary *pars = [NSMutableDictionary new];
    if (self.below) {
        pars[@"until"] = [[NSISO8601DateFormatter new] stringFromDate:self.below];
    }
    if (self.pagesize) {
        pars[@"per_page"] = [NSString stringWithFormat:@"%d",[self.pagesize intValue]];
    }
    return ([pars count] > 0) ? pars : nil;
}
@end
