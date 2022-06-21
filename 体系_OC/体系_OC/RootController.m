//
//  RootController.m
//  体系_OC
//
//  Created by z Hahn on 2022/6/20.
//

#import "RootController.h"
#import "RootController+Category.h"
#import "TimerController.h"
@interface RootController ()

@end

@implementation RootController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"name = %@",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self initGCDTimer];
    [self initCategory];
}

# pragma mark - CGD定时器
- (void)initGCDTimer{
    UIButton *btn = [UIButton new];
    [btn setTitle:@"CGD定时器" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 100, 100);
    [btn addTarget:self action:@selector(clicktBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clicktBtn{
    TimerController *vc = [TimerController new];
    [self.navigationController pushViewController:vc animated:true];
}

@end
