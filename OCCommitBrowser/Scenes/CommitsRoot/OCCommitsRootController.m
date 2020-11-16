//
//  OCCommitsRootController.m
//  OCCommitBrowser
//
//  Created by dhomes on 11/14/20.
//

#import "OCCommitsRootController.h"
#import "OCCommit.h"
#import "OCCommitCell.h"
#import "OCCommitViewModel.h"

@interface OCCommitsRootController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *table;
@property (nonatomic, strong) IBOutlet UIRefreshControl *refresh;
@end

@implementation OCCommitsRootController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Commits";

    [self setupTable];

    [(NSObject *)self.model addObserver:self forKeyPath:kCOMMITS_VIEW_OBSERVABLE_PATH options:0 context:nil];
    [self fetch];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context {
    [self.table reloadData];
}

-(void)setupTable {
    [self.table registerNib:[UINib nibWithNibName:kOCCommitCell bundle:nil] forCellReuseIdentifier:kOCCommitCell];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.rowHeight = UITableViewAutomaticDimension;
    self.refresh = [[UIRefreshControl alloc] initWithFrame:CGRectZero];
    [self.refresh addTarget:self action:@selector(fetch) forControlEvents:UIControlEventValueChanged];
    self.table.refreshControl = self.refresh;
}

-(void)fetch {
    __weak __typeof(self) weakSelf = self;
    [self.model fetch:kFetchDirectionTop completion:^(NSError *error) {
        [weakSelf reportError:error];
        [weakSelf.refresh endRefreshing];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OCCommitCell *cell = (OCCommitCell *)[tableView dequeueReusableCellWithIdentifier:kOCCommitCell];
    id<OCCommit> commit = [self.model commitAt:indexPath];
    [cell setCommit:commit];
    return cell;
}

- (void)tableView:(UITableView *)tableView
    willDisplayCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BOOL c1 = (indexPath.row == self.model.numberOfRows - 1);
    BOOL c2 = self.model.hasCommits;
    
    if ( c1 && c2) {
        __weak __typeof(self) weakSelf = self;
        [self.model fetch:kFetchDirectionBottom completion:^(NSError *error) {
            [weakSelf reportError:error];
        }];
    }
}

-(void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

-(void)reportError:(NSError *)error {
    if(!error) { return; }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction
                      actionWithTitle:@"Continue"
                      style:UIAlertActionStyleDefault
                      handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)dealloc {
    [(NSObject *)self.model removeObserver:self forKeyPath:kCOMMITS_VIEW_OBSERVABLE_PATH];
}
@end
