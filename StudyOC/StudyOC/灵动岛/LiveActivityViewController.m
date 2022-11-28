//
//  LiveActivityViewController.m
//  StudyOC
//
//  Created by z Hahn on 2022/11/28.
//

#import "LiveActivityViewController.h"
#import "StudyOC-Swift.h"

@interface LiveActivityViewController ()

@property (nonatomic, assign) LiveActivityType type;

@end

@implementation LiveActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.type = LiveActivityTypeHamburger;
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 200, 100)];
    [btn1 setTitle:@"启动灵动岛" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clicktBtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 200, 100)];
    [btn2 setTitle:@"更新灵动岛" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(clicktBtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(10, 300, 200, 100)];
    [btn3 setTitle:@"停止灵动岛" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(clicktBtn3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
}

- (void)clicktBtn1 {
    if (@available(iOS 16.1, *)) {
        [LiveActivityUtils request];
    } else {
        // Fallback on earlier versions
    }
}

- (void)clicktBtn2 {
    if (@available(iOS 16.1, *)) {
        switch (self.type) {
            case LiveActivityTypeHamburger:
                self.type = LiveActivityTypeTea;
                break;
            case LiveActivityTypeTea:
                self.type = LiveActivityTypeCookies;
                break;
            case LiveActivityTypeCookies:
                self.type = LiveActivityTypeHamburger;
                break;
        }
        [LiveActivityUtils update:self.type];
    } else {
        // Fallback on earlier versions
    }
}

- (void)clicktBtn3 {
    if (@available(iOS 16.1, *)) {
        [LiveActivityUtils end];
    } else {
        // Fallback on earlier versions
    }
}

@end
