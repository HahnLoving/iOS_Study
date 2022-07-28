//
//  TimerController.m
//  StudyOC
//
//  Created by z Hahn on 2022/6/20.
//

#import "TimerController.h"
#import "GCDTimer.h"


@interface TimerController ()

@property (strong, nonatomic) GCDTimer * timer;

@end

@implementation TimerController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"name = %@",self);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timer = [GCDTimer scheduledTimerWithTimeInterval:1 repeat:YES block:^{
        NSLog(@"执行");
        
        [self.timer stop];
        [self.timer restart];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
