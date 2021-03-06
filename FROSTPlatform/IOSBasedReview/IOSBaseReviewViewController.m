//
//  IOSBaseReviewViewController.m
//  FROSTPlatform
//
//  Created by frost on 2019/10/30.
//  Copyright © 2019 frost. All rights reserved.
//

#import "IOSBaseReviewViewController.h"
#import "KVO_KVCReviewViewController.h"
#import "OperationReviewViewController.h"
#import "GCDReviewViewController.h"

@interface IOSBaseReviewViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;


@end

@implementation IOSBaseReviewViewController

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

    
    if ([titleName isEqualToString:@"KOV/KVC"]) {
        KVO_KVCReviewViewController *kVO_KVCReviewViewController = [[KVO_KVCReviewViewController alloc] init];
        [self.navigationController pushViewController:kVO_KVCReviewViewController animated:YES];
    }
    
    if ([titleName isEqualToString:@"Operation"]) {
        OperationReviewViewController *operationReviewViewController = [[OperationReviewViewController alloc] init];
        [self.navigationController pushViewController:operationReviewViewController animated:YES];
    }
    
    if ([titleName isEqualToString:@"GCD"]) {
        GCDReviewViewController *gcdReviewViewController = [[GCDReviewViewController alloc] init];
        [self.navigationController pushViewController:gcdReviewViewController animated:YES];
    }
}



#pragma mark getters and setters

-(UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"KOV/KVC",@"GCD",@"Runloop",@"Operation",@"RunTime",nil];
    }
    return _dataArray;
}

@end
