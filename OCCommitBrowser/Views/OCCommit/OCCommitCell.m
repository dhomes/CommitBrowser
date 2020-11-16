//
//  OCCommitCell.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "OCCommitCell.h"
#import <SDWebImage/SDWebImage.h>
#import "OCCommitAppearance.h"

@interface OCCommitCell()
@property (weak, nonatomic) IBOutlet UILabel *commitMessage;
@property (weak, nonatomic) IBOutlet UILabel *commitHash;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) id<OCCommit> commit;
@end

@implementation OCCommitCell

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"MM/dd/yy hh:mm a";
    return dateFormatter;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _avatar.layer.cornerRadius = CGRectGetHeight(_avatar.frame) * 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)setCommit:(id<OCCommit>)commit {
    if (!commit) {
        return;
    }
    OCCommitAppearance *appearance = [OCCommitAppearance new];
    _commit = commit;
    _commitMessage.text = commit.message;
    _commitMessage.textColor = [appearance titleColor];
    _commitHash.text = commit.commitHash;
    _author.text = commit.authorName;
    _email.text = commit.authorEmail;
    _dateLabel.text = [[OCCommitCell dateFormatter] stringFromDate:commit.date];
    UIImage *placeholder = [[[UIImage systemImageNamed:@"person.crop.circle.fill"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] imageWithTintColor:[UIColor lightGrayColor]];

    if (commit.authorImageUrl) {
        [_avatar sd_setImageWithURL:commit.authorImageUrl placeholderImage:placeholder];
    }
    
}

@end
