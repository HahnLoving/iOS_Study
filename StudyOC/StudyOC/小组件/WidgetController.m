//
//  WidgetController.m
//  StudyOC
//
//  Created by z Hahn on 2022/6/25.
//

#import "WidgetController.h"
#import "StudyOC-Swift.h"

@interface WidgetController ()

@end

@implementation WidgetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWidget];
}

- (void)initWidget{
    UIButton *btn = [UIButton new];
    [btn setTitle:@"刷新" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 100, 100);
    [btn addTarget:self action:@selector(clicktBtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clicktBtn1{
//    [WidgetCenter];
    //使用 Groups ID 初始化一个供 App Groups 使用的 NSUserDefaults 对象
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.zhahntest"];

    //写入数据
    [userDefaults setValue:@"demo" forKey:@"demo"];

    //读取数据
    NSString *demo = [userDefaults valueForKey:@"demo"];
    NSLog(@"demo = %@",demo);
    [[WidgetKitManager shareManager] reloadAllTimelines];
}


@end
