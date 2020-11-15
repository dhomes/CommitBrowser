//
//  Coordinator.h
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import <Foundation/Foundation.h>


@interface OCCoordinator : NSObject {}
@property (nonatomic, copy, nullable) void(^didFinish)(OCCoordinator * _Nullable coordinator);
-(void)start;
-(void)pushCoordinator:(OCCoordinator * _Nonnull)coordinator;
-(void)popCoordinator:(OCCoordinator * _Nullable)coordinator;
-(void)popAll;
@end


