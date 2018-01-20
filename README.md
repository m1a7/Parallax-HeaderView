# Parallax-HeaderView


In this project implemented a parallax effect in relation to photographs in headerView. With AspectFit - content mode!


| The initial state |  Pulled down   |
| ------------- |:-------------:|
|![alt text](https://raw.githubusercontent.com/m1a7/Parallax-HeaderView/master/ScreenForReadme/screen1.png)    | ![alt text](https://raw.githubusercontent.com/m1a7/Parallax-HeaderView/master/ScreenForReadme/screen2.png)  |



## First Step
```objectivec
@interface TableViewController ()
@property(nonatomic, strong)  MEExpandableHeaderView *headerView;
@end
```

## Second Step
```objectivec
- (void) viewDidAppear:(BOOL)animated{
[super viewDidAppear:animated];

UIImage* img = [UIImage imageNamed:@"native"];

CGSize newSize = CGSizeAspectFit([img size], CGSizeMake( CGRectGetWidth(self.tableView.frame),  CGRectGetWidth(self.tableView.frame)));

self.headerView = [[MEExpandableHeaderView alloc] initWithFrame:CGRectMake(0, 0, newSize.width, newSize.height)];
self.headerView.backgroundColor = [UIColor colorWithRed:0.95 green:0.82 blue:0.64 alpha:1.0];

self.headerView.backgroundImage = img;
self.tableView.tableHeaderView = self.headerView;
}
```
## Thrid Step
```objectivec
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
if (scrollView == self.tableView)
{
[self.headerView offsetDidUpdate:scrollView.contentOffset];
}
}
```

