//
//  CALayer+SVGradientLayer.h
//  ShortVideo
//
//  Created by HK on 2019/6/22.
//  Copyright © 2019年 Babytree. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (SVGradientLayer)
+ (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame leftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor;
+ (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame topColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor;
@end

NS_ASSUME_NONNULL_END
