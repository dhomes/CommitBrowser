//
//  OCCommitsRootController.h
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import <UIKit/UIKit.h>
#import "OCCommitViewModel.h"
@interface OCCommitsRootController : UIViewController
@property(nonatomic,strong) id<OCCommitsViewModel> model;
@end
 
