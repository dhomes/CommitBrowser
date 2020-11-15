//
//  OCCommit.h
//  CommitBrowser
//
//  Created by dhomes on 11/14/20.
//

@protocol OCCommit<NSObject>
@required
    @property(nonatomic,copy) NSString *authorName;
    @property(nonatomic,copy) NSString *authorEmail;
    @property(nonatomic,copy) NSString *commitHash;
    @property(nonatomic,copy) NSString *message;
    @property(nonatomic,copy) NSURL *authorImageUrl;
    @property(nonatomic,copy) NSDate *date;
@end
