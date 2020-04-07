//
//  NSObject+Test.m
//  Demos
//
//  Created by HK on 2019/10/23.
//  Copyright © 2019 HK. All rights reserved.
//

#import "NSObject+Test.h"
#import <objc/runtime.h>

#define CATEGORY_PROPERTY_GET(type, property) - (type) property { return objc_getAssociatedObject(self, @selector(property)); }
#define CATEGORY_PROPERTY_SET(type, property, setter) - (void) setter (type) property { objc_setAssociatedObject(self, @selector(property), property, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
#define CATEGORY_PROPERTY_GET_SET(type, property, setter) CATEGORY_PROPERTY_GET(type, property) CATEGORY_PROPERTY_SET(type, property, setter)

static void *myNumberKey = &myNumberKey;
static void *myStringKey = &myStringKey;

@implementation NSObject (Test)

CATEGORY_PROPERTY_GET_SET(NSString *, myString, setMyString:)
//-(NSString *)myString {
//    return objc_getAssociatedObject(self, @selector(myString));
////    return objc_getAssociatedObject(self, myStringKey);
//}
//- (void)setMyString:(NSString *)myString {
//    objc_setAssociatedObject(self, @selector(myString), myString, OBJC_ASSOCIATION_COPY_NONATOMIC);
////    objc_setAssociatedObject(self, myStringKey, myString, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}

- (NSUInteger)myNumer {
    return [objc_getAssociatedObject(self, myNumberKey) unsignedIntValue];
}
- (void)setMyNumer:(NSUInteger)myNumer {
    objc_setAssociatedObject(self, myNumberKey, @(myNumer), OBJC_ASSOCIATION_ASSIGN);
}

@end
