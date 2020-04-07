//
//  ViewController.m
//  Demos
//
//  Created by HK on 2018/10/12.
//  Copyright © 2018年 HK. All rights reserved.
//

#import "ViewController.h"
#import "HKEasyTouchButton.h"
#import "NSObject+Test.h"
#import "CALayer+SVGradientLayer.h"

@interface AModel : NSObject
@property (nonatomic, strong) NSString *title;
@end

@implementation AModel
- (NSString *)description {
    return @"a model";
}
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    NSLog(@"--%f--",[[UIApplication sharedApplication] statusBarFrame].size.height);
    
//    [self imageMask];
//
//    [self fadeLayerMask];
    
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
    
//    [self testNan];
    
//    [self testTintColor];
//    [self test0];
    
//    [self testJoinString];
//    [self testCategoryProperty];
    
//    [self addNextBtn];
    
    
//    [self testSubview];
//    [self testReplaceString];
    
//    [self testColor];
//    [self testNilKey];
    [self testPredicate];
}

-(void)testPredicate {
    NSString *regex = @"^d.+g$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];

//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^d.+g$'"];
    BOOL isMatch = [predicate evaluateWithObject:@"dog"];
    NSLog(@"isMatch=%d",isMatch);
}

- (void)testNilKey {
    NSString *key = nil;
    NSDictionary *dic = @{@"name":@"Jack"};
    NSLog(@"key=%@",dic[key]); // not crash
}
- (void)testColor {
    UIView *blank = [[UIView alloc] initWithFrame:CGRectMake(30, 80, 100, 100)];
    blank.backgroundColor = [self colorWithHex:0xff6666];
    [self.view addSubview:blank];
    
//    CALayer *layer = [CALayer gradientLayerWithFrame:CGRectMake(30, 260, 80, 60) leftColor:[self colorWithHex:0xff8a70] rightColor:[self colorWithHex:0xff6666]];
//    [self.view.layer addSublayer:layer];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(30, 200, 100, 100)];
    img.image = [UIImage imageNamed:@"#FF5860-SRGB"];
    img.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:img];
    
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(30, 320, 100, 100)];
    img2.image = [UIImage imageNamed:@"S RGB #FF6666"];
    img2.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:img2];

    UIImageView *img3 = [[UIImageView alloc] initWithFrame:CGRectMake(30, 440, 100, 100)];
    img3.image = [UIImage imageNamed:@"DIS"];
    img3.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:img3];

}

- (UIColor *)colorWithHex:(unsigned int)hex
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0];
}


- (void)testReplaceString {
    NSArray *arr = [NSArray array];
    NSObject *obj = [arr firstObject];
    
    NSString *urlString = @"HTTPS://contentvideo.babytreeimg.com/contentplatform/20191212/115035_lhQAZSL_lOy8Opf2agLMw0bzPpg0.mp4";
    NSLog(@"B==>%@",urlString);
     
//    [urlString localizedCompare:[UIView alloc]];

    if ([[urlString lowercaseString] hasPrefix:@"https:"]) {
        urlString = [urlString stringByReplacingCharactersInRange:NSMakeRange(0, 6) withString:@"http:"];
//        urlString = [urlString stringByReplacingOccurrencesOfString:@"https:" withString:@"http:" options:NSLiteralSearch range:NSMakeRange(0, 6)];
    }
    NSLog(@"A==>%@",urlString);
}


- (void)testSubview {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text = @"哈哈哈";
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
    [view1 addSubview:label];
    view1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(20, 150, 100, 30)];
    [view2 addSubview:label];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];
}


- (void)addNextBtn {
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
    [nextBtn setTitle:@"下一页Next-Regular" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    UIButton *nextBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 260, 200, 60)];
    nextBtn1.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [nextBtn1 setTitle:@"下一页Next-Medium" forState:UIControlStateNormal];
    [nextBtn1 addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn1];

    UIButton *nextBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 320, 200, 60)];
    nextBtn2.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    [nextBtn2 setTitle:@"下一页Next-Semibold" forState:UIControlStateNormal];
    [nextBtn2 addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn2];

    
}
- (void)pushVC {
    UIViewController *nextVC = [[UIViewController alloc] init];
    nextVC.view.backgroundColor = [UIColor whiteColor];
    nextVC.title = @"next";
    [self.navigationController pushViewController:nextVC animated:YES];
}

-(void)testCategoryProperty {
    NSObject *obj = [[NSObject alloc] init];
    obj.myString = @"hahaha";
    obj.myNumer = 99;
    
    NSString *str = obj.myString;
    NSInteger num = obj.myNumer;
    NSLog(@"string=%@, numer=%ld",str, num);
}

- (void)testJoinString {
    AModel *model = [[AModel alloc] init];
    NSArray *arr = @[@"sss",@(3),@{@"k":@"v"},model];
    NSString *string = [arr componentsJoinedByString:@","];
    NSLog(@"string=%@",string);
}

- (void)test0 {
    NSDictionary *dict = @{@"code":@"0"};
    if ([[dict objectForKey:@"codek"] integerValue]==0) {
        NSLog(@"==0");
    } else {
        NSLog(@"not 0");
    }
}

- (void)testTintColor {
    self.view.tintColor = [UIColor greenColor];
    UIImage *image = [UIImage imageNamed:@"baf_bind_device"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 200, 200, 60)];
    [btn setTitle:@"tintColor" forState:UIControlStateNormal];
//    [btn setTitleColor:self.view.tintColor forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    btn.tintColor = self.view.tintColor;

    [self.view addSubview:btn];
}

- (void)tintColorDidChange {
    
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
