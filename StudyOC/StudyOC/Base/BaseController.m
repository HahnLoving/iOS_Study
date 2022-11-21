//
//  BaseController.m
//  StudyOC
//
//  Created by z Hahn on 2022/7/22.
//

#import "BaseController.h"
#import "BaseModel.h"
#import "BaseController+Category.h"
#import "TimerController.h"
#import "WidgetController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    switch (self.type) {
        case CellTypeWidget:
            self.title = @"小组件";
            break;
            
        case CellTypeCategory:
            self.title = @"分类";
            [self initCategory];
            break;
            
        case CellTypeCGDTimer:
            self.title = @"CGD 定时器";
            break;
            
        case CellTypeMemory:
            self.title = @"内存管理";
            break;
            
        case CellTypeRunTime:
            self.title = @"runtime";
            break;
            
        default:
            break;
    }
}


@end
