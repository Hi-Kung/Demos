//
//  HKEasyTouchButton.m
//  Demos
//
//  Created by HK on 2019/1/29.
//  Copyright © 2019年 HK. All rights reserved.
//

#import "HKEasyTouchButton.h"

@implementation HKEasyTouchButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect touchableArea = CGRectInset(self.bounds, -20, -20);
    if (CGRectContainsPoint(touchableArea, point)) {
        return YES;
    }
    return NO;
}

@end
