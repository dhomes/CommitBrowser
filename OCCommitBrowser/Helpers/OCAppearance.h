//
//  OCAppearance.h
//  CommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import <UIKit/UIKit.h>

@protocol OCAppearance <NSObject>
@required
-(UIColor *)accentColor;
-(UIColor *)navigationBarBackgroundColor;
-(UIColor *)tableViewSeparatorColor;
-(UIColor *)navigationTitleTextColor;
-(UIColor *)borderColor;
-(UIColor *)titleColor;
-(UIColor *)activityIndicatorColor;
@end


