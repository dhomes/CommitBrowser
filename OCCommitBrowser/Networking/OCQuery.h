//
//  OCQuery.h
//  OCCommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import <Foundation/Foundation.h>

@interface OCQuery : NSObject
@property(nonatomic,copy) NSNumber *pagesize;
@property(nonatomic,copy) NSDate *below;
+(instancetype)defaultQuery;
-(instancetype)initWithPageSize:(NSNumber *)pagesize below:(NSDate *)date;
-(NSDictionary *)queryParameters;
@end
