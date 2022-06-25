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
    
    //使用 Groups ID 初始化一个供 App Groups 使用的 NSUserDefaults 对象
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.zhahntest"];

    //写入数据
    [userDefaults setValue:@"123456789" forKey:@"userID"];

    //读取数据
    NSString *userIDStr = [userDefaults valueForKey:@"userID"];
    NSLog(@"zzr123 = %@",userIDStr);
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
