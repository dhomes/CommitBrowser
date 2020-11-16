//
//  OCNetworking.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "OCGitHubNetworking.h"
#import "AFNetworking.h"
#import "Mantle.h"

@implementation OCGitHubNetworking

-(void)fetchCommitsFor:(OCRepository *_Nonnull)repository query:(OCQuery * _Nullable)query completion: (CommitBlock _Nullable )completion {
    
    NSURL *url = [NSURL URLWithString:[repository baseUrlString]];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    [manager GET:url.absoluteString parameters:[query queryParameters] headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        NSArray *commits = [MTLJSONAdapter modelsOfClass:OCGithubCommit.class fromJSONArray:responseObject error:&error];
        if (error != nil) {
            dispatch_async(mainQueue, ^{
                completion(nil,error);
            });
            return;
        }
        dispatch_async(mainQueue, ^{
            completion(commits,nil);
        });

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(mainQueue, ^{
            completion(nil,error);
        });
    }];
    
    
    
}
@end
