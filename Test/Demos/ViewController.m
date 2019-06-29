//
//  ViewController.m
//  Demos
//
//  Created by HK on 2018/10/12.
//  Copyright © 2018年 HK. All rights reserved.
//

#import "ViewController.h"
#import "HKEasyTouchButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
//    NSLog(@"--%f--",[[UIApplication sharedApplication] statusBarFrame].size.height);
    
//    [self imageMask];
//
    [self fadeLayerMask];
    
//    [self testResponderChain];
//    [self testArr];
//    [self testHttpHeader];
    
    
    
//    NSString *intercept = @"http://*.babytree.com/community/*/topic", *url = @"bbtrp://com.babytree.pregnancy/bb_common_service/upload_bi_data?an=1&ii=12&be=ABtest_cms=116_8994&";
//    [self isValidUrl:url withInterceptIndex:intercept behaviorType:1];
//    UIImage *img = [UIImage imageWithData:nil];
//    NSLog(@"data:%@",img);
//    [self testRandom];
//    [self getProxyStatus];
    
//    [self threadSync];
    
    
    [self testNan];
}

- (void)testNan {
//    float n = 8/0.0;
    NSString *str = nil;
    CGFloat h = [str sizeWithFont:[UIFont systemFontOfSize:13]].height;
    h = 0.0/0.0;
    if (isfinite(h)) {
        NSLog(@"finite value");
    }else if (isnan(h)) {
        NSLog(@"NAN value");
    } else if (isinf(h)) {
        NSLog(@"INFINITY value");
    }
}
- (void)threadSync {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    __block BOOL allDone = NO;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        allDone = YES;
        dispatch_semaphore_signal(sema);
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    NSLog(@"all done : %d", allDone);
}

- (BOOL)getProxyStatus {
    NSURL *testUrl = [NSURL URLWithString:@"http://www.baidu.com"];
    NSArray *proxies = (__bridge NSArray *)(CFNetworkCopyProxiesForURL((__bridge CFURLRef _Nonnull)(testUrl), CFNetworkCopySystemProxySettings()));
    NSDictionary *settings = [proxies objectAtIndex:0];
    
    NSLog(@"host=%@", [settings objectForKey:(NSString *)kCFProxyHostNameKey]);
    NSLog(@"port=%@", [settings objectForKey:(NSString *)kCFProxyPortNumberKey]);
    NSLog(@"type=%@", [settings objectForKey:(NSString *)kCFProxyTypeKey]);
    
    if ([[settings objectForKey:(NSString *)kCFProxyTypeKey] isEqualToString:@"kCFProxyTypeNone"]){
        //没有设置代理
        NSLog(@"没有设置代理");
        return NO;
    }else{
        //设置代理了
        NSLog(@"设置代理了");
        return YES;
    }
}


- (void)testRandom {
    for (int i = 0; i<20; i++) {
       NSInteger result = [self randomInRangeFrom:0 to:15];
        NSLog(@"\n== %ld",(long)result);
    }
}

- (NSInteger)randomInRangeFrom:(NSInteger)from to:(NSInteger)to {
    if (from > to) {
        swapInt(&from, &to);
    }
    return arc4random()%((to - from) + 1) + from;
}

void swapInt(NSInteger *x, NSInteger *y) {
    
    if (x == y) {
        return;
    }
    
    *x = *x ^ *y;
    *y = *x ^ *y;
    *x = *x ^ *y;
}


- (BOOL)isValidUrl:(NSString *)sourceUrl withInterceptIndex:(NSString *)interceptIndex behaviorType:(NSInteger)type {
    BOOL isMatch = NO;
    if (type==1) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", interceptIndex ?: @""];
        isMatch = [predicate evaluateWithObject:sourceUrl ?: @""];
    } else if (type==2) {
        isMatch = [sourceUrl isEqualToString:interceptIndex];
    } else if (type==3) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF LIKE %@", interceptIndex ?: @""];
        isMatch = [predicate evaluateWithObject:sourceUrl ?: @""];
    }
    return isMatch;
}

- (void)testHttpHeader {
    NSString *path = @"http://mapiweb.babytree.com/newapi/local_push/get?";

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    NSMutableURLRequest *mRequest = [request mutableCopy];
    NSString *clientInfo = [self JSONString:[self clientInfo]];
    [mRequest addValue:[self clientInfo] forHTTPHeaderField:@"clientInfo"];
    request = [mRequest copy];
    
    NSLog(@"header:--%@",request.allHTTPHeaderFields);

}

- (NSMutableDictionary *)clientInfo {
    NSMutableDictionary *clientInfo = [NSMutableDictionary dictionary];
    [clientInfo setObject:@"2.3" forKey:@"clientAppVersion"];
    [clientInfo setObject:@"hehe" forKey:@"clientip"];
    return clientInfo;
}

-(NSString *)JSONString:(NSDictionary *)dict{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (void)testArr {
    NSArray *ar = @[@"1",@"2",@"3",@"4",@"5"];
    NSMutableArray *w = [ar mutableCopy];
    for (int i=0; i<w.count; i++) {
        [w removeObjectAtIndex:i];
    }
    NSLog(@"%@",ar);
}

/*
 CALayer的mask属性，也是CALayer类，它定义了其宿主图层的可见区域
 mask的内容颜色无意义，决定宿主图层可见内容的是mask的轮廓和透明度，
 只有在mask轮廓范围内且透明度大于0的时候，其下覆盖的宿主图层内容才会显示出来。

 */

- (void)imageMask {
    // 图片蒙板
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imgview.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:imgview];
    
    CALayer *mask = [CALayer layer];
    UIImage *maskImg = [UIImage imageNamed:@"play"];
    mask.contents = (__bridge id _Nullable)(maskImg.CGImage);
    mask.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    imgview.layer.mask = mask;
}

- (void)fadeLayerMask {
    // 渐变图层蒙板
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 60)];
    textLabel.text = @"Dispose of any resources that can be recreated.";
    textLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:textLabel];
    
    CAGradientLayer *gMask = [CAGradientLayer layer];
    gMask.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
    
    gMask.colors = @[
                     (__bridge id)[UIColor colorWithWhite:1 alpha:1].CGColor,
                     (__bridge id)[UIColor colorWithWhite:1 alpha:0].CGColor,
                     ];
    gMask.locations = @[@0,@1];
    gMask.startPoint = CGPointMake(0, 0 );
    gMask.endPoint = CGPointMake(1, 0);
    textLabel.layer.mask = gMask;
}

- (void)testResponderChain {
    HKEasyTouchButton *button = [[HKEasyTouchButton alloc] initWithFrame:CGRectMake(60, 100, 100, 100)];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(HKEasyTouchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIView *back = [[UIView alloc] initWithFrame:CGRectInset(button.frame, -20, -20)];
    back.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:back];
    [self.view sendSubviewToBack:back];
}

- (void)HKEasyTouchButtonClicked {
    NSLog(@"==HKEasyTouchButtonClicked===");
}


- (void)testFileManager {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LaunchImage_2436" ofType:@"png"];
    UIImage *copy = [UIImage imageNamed:@"LaunchImage_2436_copy"];
    NSData *data = UIImagePNGRepresentation(copy);
    BOOL removeResult =[[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    BOOL result = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
    NSLog(@"~~~removeResult=%d\n-------result =%d",removeResult,result);
}


@end
