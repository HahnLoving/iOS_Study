//
//  RootController.m
//  StudyOC
//
//  Created by z Hahn on 2022/6/20.
//

#import "RootController.h"
#import "RootController+Category.h"
#import "TimerController.h"
#import "WidgetController.h"

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
//    [self initCategory];
    [self initWidget];
    
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

# pragma mark - 小组件
- (void)initWidget{
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.baidu.com"]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            //data: 响应体信息
            //response: 响应头信息
            //error: 错误信息�
            //解析数据
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"%@", dict);
        }];
        [dataTask resume];
    
    UIButton *btn = [UIButton new];
    [btn setTitle:@"小组件" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 100, 100);
    [btn addTarget:self action:@selector(clicktBtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clicktBtn1{
    WidgetController *vc = [WidgetController new];
    [self.navigationController pushViewController:vc animated:true];
}

@end
