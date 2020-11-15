//
//  OCCommitsRootController.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "OCCommitsRootController.h"
#import "OCGithubCommit.h"
#import "OCNetworking.h"
#import "OCCommitCell.h"

@interface OCCommitsRootController()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSArray<id<OCCommit>> *commits;
@end

@implementation OCCommitsRootController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.commits = [NSArray new];
    self.title = @"Commits";
    [self setupTable];
    [[OCNetworking new] fetchCommits:^(NSArray<OCGithubCommit *> * newCommits, NSError * error) {
        if (newCommits) {
            self.commits = newCommits;
            [self.table reloadData];
        }
        if (error) {
            NSLog(@"%@",error);
        }
    }];
}

-(void)setupTable {
    [_table registerNib:[UINib nibWithNibName:kOCCommitCell bundle:nil] forCellReuseIdentifier:kOCCommitCell];
    _table.delegate = self;
    _table.dataSource = self;
    _table.rowHeight = UITableViewAutomaticDimension;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.commits count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OCCommitCell *cell = (OCCommitCell *)[tableView dequeueReusableCellWithIdentifier:kOCCommitCell];
    id<OCCommit> commit = [self.commits objectAtIndex:indexPath.row];
    [cell setCommit:commit];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}
@end
