//
//  TableViewController.m
//  Parallax-HeaderView
//
//  Created by Uber on 20/01/2018.
//  Copyright © 2018 Uber. All rights reserved.
//

#import "TableViewController.h"
#import "MEExpandableHeaderView.h"

CGSize CGSizeAspectFit(const CGSize aspectRatio, const CGSize boundingSize)
{
    CGSize aspectFitSize = CGSizeMake(boundingSize.width, boundingSize.height);
    float mW = boundingSize.width / aspectRatio.width;
    float mH = boundingSize.height / aspectRatio.height;
    if( mH < mW )
        aspectFitSize.width = mH * aspectRatio.width;
    else if( mW < mH )
        aspectFitSize.height = mW * aspectRatio.height;
    return aspectFitSize;
}


@interface TableViewController ()
@property(nonatomic, strong)  MEExpandableHeaderView *headerView;
@end


@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 }

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIImage* img = [UIImage imageNamed:@"native"];
 
    CGSize newSize = CGSizeAspectFit([img size], CGSizeMake( CGRectGetWidth(self.tableView.frame),  CGRectGetWidth(self.tableView.frame)));
    
    self.headerView = [[MEExpandableHeaderView alloc] initWithFrame:CGRectMake(0, 0, newSize.width, newSize.height)];
    self.headerView.backgroundColor = [UIColor colorWithRed:0.95 green:0.82 blue:0.64 alpha:1.0];

    self.headerView.backgroundImage = img;
    self.tableView.tableHeaderView = self.headerView;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView)
    {
        [self.headerView offsetDidUpdate:scrollView.contentOffset];
    }
}

@end
