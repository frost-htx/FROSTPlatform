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
#import "DemoViewModel.h"
#import "OpenGLDemoViewController.h"
#import "C++DemoViewController.h"
#import "AlgorithmViewController.h"
#import "GPUImageViewController.h"
#import "MapBoxViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,DemoViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,weak)   DemoViewController *demoViewController;
@property (nonatomic,strong) NSArray *array1;
@property (nonatomic,strong) DemoViewModel *demoViewModel;

@property (nonatomic,strong) id <DemoViewControllerDelegate> demoDelegate;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTableView];
    [self layoutSubViews];
    
    NSString *docPath = [FileTools getAppDocumentsPath];
    NSLog(@"------------DocumentsPath:%@",docPath);
    
    
//    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
//    
//    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"
//                                                          action:@"button_press"
//                                                           label:@"play"
//                                                           value:nil] build]];
    
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
        DemoViewController *demoViewController = [[DemoViewController alloc] init];
        demoViewController.delegate = self ;
        self.demoDelegate = demoViewController.delegate;
        [self.navigationController pushViewController:demoViewController animated:YES];
        self.demoViewController = demoViewController;
    }
    if ([titleName isEqualToString:@"OpenGl"]) {
        OpenGLDemoViewController *openGLDemoViewController = [[OpenGLDemoViewController alloc] init];
        [self.navigationController pushViewController:openGLDemoViewController animated:YES];
    }
    if ([titleName isEqualToString:@"C++"]) {
        C__DemoViewController *c__DemoViewController = [[C__DemoViewController alloc] init];
        [self.navigationController pushViewController:c__DemoViewController animated:YES];
    }
    if ([titleName isEqualToString:@"Algorith"]) {
        AlgorithmViewController *c__DemoViewController = [[AlgorithmViewController alloc] init];
        [self.navigationController pushViewController:c__DemoViewController animated:YES];
    }
    if ([titleName isEqualToString:@"GPUImage"]) {
        GPUImageViewController *gpuImageViewController = [[GPUImageViewController alloc] init];
        [self.navigationController pushViewController:gpuImageViewController animated:YES];
    }
    if ([titleName isEqualToString:@"Mapbox"]) {
        MapBoxViewController *gpuImageViewController = [[MapBoxViewController alloc] init];
        [self.navigationController pushViewController:gpuImageViewController animated:YES];
    }
}

#pragma mark DemoViewControllerDelegate 

-(void)test {
    [self.mainTableView reloadData];
}

#pragma mark getters and setters

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"编辑器",@"Demo",@"OpenGl",@"C++",@"Algorith",@"GPUImage",@"Mapbox",nil];
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

-(DemoViewModel *)demoViewModel {
    if (!_demoViewModel) {
        _demoViewModel = [[DemoViewModel alloc] init];
    }
    return _demoViewModel;
}

@end
