//
//  BaseController+Category.m
//  StudyOC
//
//  Created by z Hahn on 2022/7/22.
//

#import "BaseController+Category.h"
#import "PersonModel.h"
#import "PersonModel+Category.h"
#import "PersonModel+Ex.h"

@implementation BaseController (Category)

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Category name = %@",self);
}

# pragma mark - Category
- (void)initCategory{
    PersonModel *person = [PersonModel new];
    person.age = 10;
    NSLog(@"person age = %d",person.age);
    
    // 复值失败，因为Category只是添加了属性，没有添加成员变量
//    person.name = @"jack";
//    NSLog(@"person name = %@",person.name);
    
    person.objName = @"jack";
    NSLog(@"person objName = %@",person.objName);
    
    [person exDemo];
}


@end
