//
//  OCCommitAppearance.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/15/20.
//

#import "OCCommitAppearance.h"

@implementation OCCommitAppearance
-(UIColor *)clearColor {
    return [UIColor clearColor];
}

-(UIColor *)accentColor {
    return [UIColor colorNamed:@"AccentColor"];
}

-(UIColor *)navigationBarBackgroundColor {
    return [UIColor colorNamed:@"BarColor"];
}

-(UIColor *)tableViewSeparatorColor {
    return [UIColor colorNamed:@"SeparatorColor"];
}

-(UIColor *)navigationTitleTextColor {
    return [UIColor colorNamed:@"NavigationTitleTextColor"];
}

-(UIColor *)borderColor {
    return [UIColor colorNamed:@"BorderColor"];
}

-(UIColor *)titleColor {
    return [UIColor colorNamed:@"TitleColor"];
}

-(UIColor *)activityIndicatorColor {
    return [UIColor whiteColor];
}

@end
