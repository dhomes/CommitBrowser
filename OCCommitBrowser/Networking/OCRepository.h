//
//  OCRepository.h
//  OCCommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import <Foundation/Foundation.h>
 
@interface OCRepository : NSObject
@property(nonatomic,copy) NSString *reposityName;
@property(nonatomic,copy) NSString *owner;
+(instancetype)defaultRepository;
-(instancetype)initWithRepository:(NSString *)repositoryName owner:(NSString *)owner;
-(NSString *)baseUrlString;
@end
 
