//
//  MemoryController.m
//  StudyOC
//
//  Created by z Hahn on 2022/7/27.
//

#import "MemoryController.h"
#import "BaseModel.h"

@interface MemoryController ()

@end

/**
 内存管理机制
 https://mp.weixin.qq.com/s/lRCUC_eTYb5N1MUwyXKWHg
 */

@implementation MemoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建对象
    BaseModel *model = [BaseModel new];

    // 持有对象
    id model1 = model;

    NSLog(@"%p and %p",&model, &model1);
}



@end
