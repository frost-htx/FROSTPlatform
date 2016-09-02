//
//  ViewController.m
//  FROSTPlatform
//
//  Created by frost on 16/7/17.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "ViewController.h"
#import "EditMainViewController.h"
#import "DemoViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,DemoViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) DemoViewController *demoViewController;
@property (nonatomic,strong) NSArray *array1;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTableView];
    [self layoutSubViews];
}

-(void)layoutSubViews {
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *mainCell = @"mainCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCell];
    if (cell == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mainCell];
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *titleName = [_dataArray objectAtIndex:indexPath.row ];
    if ([titleName isEqualToString:@"编辑器"]) {
        EditMainViewController *editMainViewController = [[EditMainViewController alloc] init];
        [self.navigationController pushViewController:editMainViewController animated:YES];
    }
    if ([titleName isEqualToString:@"Demo"]) {
        DemoViewController *demoViewController1 = [[DemoViewController alloc] init];
        [demoViewController1 loadData:^(BOOL success) {
            LoggerModel(1,@"this DemoViewController model :%@",self);
        }];
        self.demoViewController = demoViewController1;
        [self.navigationController pushViewController:demoViewController1 animated:YES];
    }
}

#pragma mark DemoViewControllerDelegate 

-(void)test {
    [self.mainTableView reloadData];
}

#pragma mark getters and setters

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"编辑器",@"Demo",nil];
    }
    return _dataArray;
}

-(UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}
@end
