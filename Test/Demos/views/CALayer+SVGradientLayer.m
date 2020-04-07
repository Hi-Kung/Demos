//
//  CALayer+SVGradientLayer.m
//  ShortVideo
//
//  Created by HK on 2019/6/22.
//  Copyright © 2019年 Babytree. All rights reserved.
//

#import "CALayer+SVGradientLayer.h"

@implementation CALayer (SVGradientLayer)

+ (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame leftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor {
    
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = frame;
    gradientLayer.locations = @[@0,@1];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.colors = @[(__bridge id)leftColor.CGColor,(__bridge id)rightColor.CGColor];
    
    return gradientLayer;
}

+ (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame topColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor {
    
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = frame;
    gradientLayer.locations = @[@0,@1];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.colors = @[(__bridge id)topColor.CGColor,(__bridge id)bottomColor.CGColor];
    
    return gradientLayer;
}

@end
