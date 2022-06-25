//
//  PersonModel.m
//  StudyOC
//
//  Created by z Hahn on 2022/6/21.
//

#import "PersonModel.h"
#import "PersonModel+Ex.h"

@implementation PersonModel

- (void)exDemo
{
    PersonModel *model = [PersonModel new];
    model.exStr = @"Ex";
    NSLog(@"ex = %@",model.exStr);
}

@end
