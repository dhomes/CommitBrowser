//
//  OCGithubCommit.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "OCGithubCommit.h"

@implementation OCGithubCommit

@synthesize authorName;
@synthesize authorEmail;
@synthesize commitHash;
@synthesize message;
@synthesize authorImageUrl;
@synthesize date;
+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"authorImageUrl": @"author.avatar_url",
        @"authorName": @"commit.author.name",
        @"authorEmail": @"commit.author.email",
        @"message": @"commit.message",
        @"date": @"commit.author.date",
        @"commitHash" : @"sha"
    };
}

+(NSValueTransformer *)authorImageUrlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+(NSValueTransformer *)dateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString * dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;

    return self;
}


@end
