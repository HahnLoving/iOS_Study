//
//  RootController.m
//  StudyOC
//
//  Created by z Hahn on 2022/6/20.
//

#import "RootController.h"
#import "BaseController.h"
#import "BaseModel.h"
#import "BaseController+Category.h"
#import "TimerController.h"
#import "WidgetController.h"
#import "MemoryController.h"
#import "RunTimeController.h"
#import "LiveActivityViewController.h"

@interface RootController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;

@end

@implementation RootController

- (NSArray *)array {
    if (!_array) {
        _array = @[
            [NSNumber numberWithInteger:CellTypeWidget],
            [NSNumber numberWithInteger:CellTypeCategory],
            [NSNumber numberWithInteger:CellTypeCGDTimer],
            [NSNumber numberWithInteger:CellTypeMemory],
            [NSNumber numberWithInteger:CellTypeRunTime],
            [NSNumber numberWithInteger:CellTypeLiveActivity],
        ];
    }
    return _array;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"name = %@",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    switch (indexPath.row) {
        case CellTypeWidget:
            cell.textLabel.text = @"小组件";
            break;
            
        case CellTypeCategory:
            cell.textLabel.text = @"分类";
            break;
            
        case CellTypeCGDTimer:
            cell.textLabel.text = @"CGD 定时器";
            break;
            
        case CellTypeMemory:
            cell.textLabel.text = @"内存管理";
            break;
            
        case CellTypeRunTime:
            cell.textLabel.text = @"runtime";
            break;
            
        case CellTypeLiveActivity:
            cell.textLabel.text = @"灵动岛";
            break;
            
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case CellTypeWidget:
        {
            /**
             小组件
             https://mp.weixin.qq.com/s/_DF_s_j49yroLf-gIID0Tw
             */
            WidgetController *vc = [WidgetController new];
            vc.type = CellTypeWidget;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case CellTypeCategory:
        {
            /**
             分类和扩展
             https://mp.weixin.qq.com/s?__biz=Mzg5Mjc1ODI5Nw==&mid=2247483744&idx=1&sn=c70ef6e419738a5c0a1cd22e50007330&chksm=c0387116f74ff800edafd96b55776da388809d3e2bbdb45e05712de60b3931b15c238ff22ffe&token=147400309&lang=zh_CN#rd
             */
            BaseController *vc = [BaseController new];
            vc.type = CellTypeCategory;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case CellTypeCGDTimer:
        {
            /**
             CGD定时器
             https://mp.weixin.qq.com/s/7cPyKK5_JtVEjT9Jvyp0gw
             */
            TimerController *vc = [TimerController new];
            vc.type = CellTypeCGDTimer;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case CellTypeMemory:
        {
            /**
             内存管理机制
             https://mp.weixin.qq.com/s/lRCUC_eTYb5N1MUwyXKWHg
             */
            MemoryController *vc = [MemoryController new];
            vc.type = CellTypeMemory;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case CellTypeRunTime:
        {
            /**
             内存管理机制
             */
            RunTimeController *vc = [RunTimeController new];
            vc.type = CellTypeRunTime;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case CellTypeLiveActivity:
        {
            /**
             灵动岛
             */
            LiveActivityViewController *vc = [LiveActivityViewController new];
            vc.type = CellTypeLiveActivity;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
