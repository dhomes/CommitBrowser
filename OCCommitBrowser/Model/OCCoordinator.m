//
//  Coordinator.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "OCCoordinator.h"
@interface OCCoordinator()
@property(nonatomic,copy,nullable) NSMutableArray<OCCoordinator *> *childCoordinators;
@end

@implementation OCCoordinator

-(instancetype)init {
    self = [super init];
    if (self) {
        self.childCoordinators = [NSMutableArray<OCCoordinator *> new];
    }
    return self;
}
-(void)start {
    
}

-(void)pushCoordinator:(OCCoordinator * _Nonnull)coordinator {
    __weak __typeof__(self) weakSelf = self;
    coordinator.didFinish = ^(OCCoordinator * _Nullable coordinator) {
        [weakSelf popCoordinator:coordinator];
    };
    [coordinator start];
    [self.childCoordinators addObject:coordinator];
    
}

-(void)popCoordinator:(OCCoordinator * _Nullable)coordinator {
    if (!coordinator) {
        return;
    }
    
    if ([self.childCoordinators containsObject:coordinator]) {
        [self.childCoordinators removeObjectAtIndex:[self.childCoordinators indexOfObject:coordinator]];
    }
    
}

-(void)popAll {
    [self.childCoordinators enumerateObjectsUsingBlock:^(OCCoordinator * _Nonnull childCoordinator, NSUInteger idx, BOOL * _Nonnull stop) {
        [childCoordinator popAll];
    }];
    [self.childCoordinators removeAllObjects];
}

@end
