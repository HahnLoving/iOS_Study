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
            [NSNumber numberWithInteger:CellTypeCGDTimer]
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
            
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case CellTypeWidget:
        {
            WidgetController *vc = [WidgetController new];
            vc.type = CellTypeWidget;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case CellTypeCategory:
        {
            BaseController *vc = [BaseController new];
            vc.type = CellTypeCategory;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case CellTypeCGDTimer:
        {
            TimerController *vc = [TimerController new];
            vc.type = CellTypeCGDTimer;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
