//
//  OCCommitCell.h
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import <UIKit/UIKit.h>
#import "OCCommit.h"

#define kOCCommitCell @"OCCommitCell"

@interface OCCommitCell : UITableViewCell
-(void)setCommit:(id<OCCommit>)commit;
@end

