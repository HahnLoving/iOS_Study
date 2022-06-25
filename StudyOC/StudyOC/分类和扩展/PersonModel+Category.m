//
//  PersonModel+Category.m
//  StudyOC
//
//  Created by z Hahn on 2022/6/21.
//

#import "PersonModel+Category.h"
#import <objc/runtime.h>

static NSString *objNameKey = @"objNameKey";
@implementation PersonModel (Category)

- (void)setObjName:(NSString *)objName
{
    objc_setAssociatedObject(self, &objNameKey, objName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)objName
{
    return objc_getAssociatedObject(self, &objNameKey);
}

@end
