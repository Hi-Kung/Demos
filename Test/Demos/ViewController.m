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
#import "Person.h"
#import "AppDelegate.h"
#import "NextViewController.h"

@interface AModel : NSObject
@property (nonatomic, strong) NSString *title;
@end

@implementation AModel
- (NSString *)description {
    return @"a model";
}
@end

@interface ViewController ()
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
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
//    [self testPredicate];
//    [self base64Image];
//    [self testProperty];
//    [self testEnumerateBlock];
//    [self testUrl];
//    [self testRunloop];
//    [self testMutithread];
//    [self testMutableArr];
//    [self test_dispatch_sync];
//    [self testKVO];
//    [self testTrueAndFalse];
    [self testRangeOfString];
}

- (void)testRangeOfString {
    NSString *member_count_fmt_str = @"";
    NSString *content = [NSString stringWithFormat:@"真诚邀请加入圈子，和%@位妈妈一起交流分享",member_count_fmt_str];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 2;
    NSMutableAttributedString *attrContent = [[NSMutableAttributedString alloc] initWithString:content];
    [attrContent addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor whiteColor],NSParagraphStyleAttributeName:style} range:NSMakeRange(0, content.length)];
    NSRange range = [content rangeOfString:member_count_fmt_str]; // nil crash!
    [attrContent addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:range];
    NSLog(@"%@",attrContent);

}

- (void)testTrueAndFalse {
    NSDictionary *dict = @{@"key":@"false"};
    BOOL isTrue = [[dict objectForKey:@"key"] boolValue];
    NSLog(@"===isTrue:%d",isTrue);
}

- (void)testKVO {
    Person *person = [[Person alloc] init];
    person.name = [@"jack" mutableCopy];
    
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    // 手动触发kvo，两句缺一不可
    [person willChangeValueForKey:@"name"];//
    [person didChangeValueForKey:@"name"]; // 内部调用observeValueForKeyPath方法
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"--- kvo got:\n%@",change);
}

- (void)test_dispatch_sync {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"thread:%@",[NSThread currentThread]);
        UIViewController *vc = [AppDelegate currentViewController];
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
        btn.backgroundColor = [UIColor blueColor];
        [vc.view addSubview:btn];
    });
}

- (void)testMutableArr {
    NSMutableArray *arr0 = [NSMutableArray arrayWithArray:@[@"1",@"2"]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:arr0 forKey:@"mArr"];
    
    [defaults setObject:@"0" forKey:@"test"];
    
//    NSMutableArray *arr1 = [defaults objectForKey:@"mArr"];
//    if ([arr1 isKindOfClass:[NSMutableArray class]]) {
//        [arr1 removeAllObjects];
//        NSLog(@"arr1:%@",arr1);
//    }
    
    NSArray *arr = [defaults objectForKey:@"mArr"];
    NSMutableArray * arr1 = [arr mutableCopy];
    if ([arr1 isKindOfClass:[NSMutableArray class]]) {
           [arr1 removeAllObjects];
           NSLog(@"arr1:%@",arr1);
       }
}

- (void)testMutithread {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{@"ts":@"0",@"name":@"jack",@"age":@"3"}];
    
    dispatch_queue_t queue  = dispatch_queue_create("aqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_queue_t queue2  = dispatch_queue_create("bqueue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        [dict setObject:@"0088" forKey:@"ts"];
        [dict setObject:@"tom" forKey:@"name"];
        [dict setObject:@"9" forKey:@"age"];
        NSMutableDictionary *dictCopy0 = [NSMutableDictionary dictionary];
        [dictCopy0 addEntriesFromDictionary:dict];
        NSLog(@"copydict0:%@",dictCopy0);
    });
    dispatch_async(queue, ^{
        [dict setObject:@"00df88" forKey:@"ts"];
        [dict setObject:@"tdgdgd" forKey:@"name"];
        [dict setObject:@"94" forKey:@"age"];
        NSMutableDictionary *dictCopy1 = [NSMutableDictionary dictionary];
        [dictCopy1 addEntriesFromDictionary:dict];
        NSLog(@"copydict1:%@",dictCopy1);
    });

    
    dispatch_async(queue2, ^{
        [dict setObject:@"00288" forKey:@"ts"];
        [dict setObject:@"treom" forKey:@"name"];
        [dict setObject:@"934" forKey:@"age"];
        NSMutableDictionary *dictCopy2 = [NSMutableDictionary dictionary];
        [dictCopy2 addEntriesFromDictionary:dict];
        NSLog(@"copydict2:%@",dictCopy2);
    });

    dispatch_async(queue2, ^{
        [dict setObject:@"0098" forKey:@"ts"];
        [dict setObject:@"tom" forKey:@"name"];
        [dict setObject:@"9" forKey:@"age"];
        
        NSMutableDictionary *dictCopy3 = [NSMutableDictionary dictionary];
        [dictCopy3 addEntriesFromDictionary:dict];
        NSLog(@"copydict3:%@",dictCopy3);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(queue2, ^{
            [dict setObject:@"000" forKey:@"ts"];
            [dict setObject:@"555" forKey:@"name"];
            [dict setObject:@"999" forKey:@"age"];
            
            NSMutableDictionary *dictCopy3 = [NSMutableDictionary dictionary];
            [dictCopy3 addEntriesFromDictionary:dict];
            NSLog(@"copydict3:%@",dictCopy3);
        });

    });
    
}

- (void)testRunloop
{
 dispatch_async(dispatch_get_global_queue(0, 0), ^{

 NSLog(@"开启线程…….");
 self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(doTimerTask1:) userInfo:nil repeats:YES];
 [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];

 //一般情况下，若runloop一直存在，后面的代码就不执行了
 //最后一个参数，是否处理完事件返回,结束runLoop
 SInt32 result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 100, YES);
 /*
 kCFRunLoopRunFinished = 1, //Run Loop结束，没有Timer或者其他Input Source
 kCFRunLoopRunStopped = 2, //Run Loop被停止，使用CFRunLoopStop停止Run Loop
 kCFRunLoopRunTimedOut = 3, //Run Loop超时
 kCFRunLoopRunHandledSource = 4 ////Run Loop处理完事件，注意Timer事件的触发是不会让Run Loop退出返回的，即使CFRunLoopRunInMode的第三个参数是YES也不行
 */
 switch (result)
  {
 case kCFRunLoopRunFinished:
 NSLog(@"kCFRunLoopRunFinished");

 break;
 case kCFRunLoopRunStopped:
 NSLog(@"kCFRunLoopRunStopped");

 case kCFRunLoopRunTimedOut:
 NSLog(@"kCFRunLoopRunTimedOut");

 case kCFRunLoopRunHandledSource:
 NSLog(@"kCFRunLoopRunHandledSource");
 default:
 break;
 }

 NSLog(@"结束线程…….");

 });

}

- (void)doTimerTask1:(NSTimer *)timer
{

 self.count++;
 if (self.count == 2)
 {
 //停止timer，runloop没有source，没有timer，没有observer，退出runloop，线程随之往下执行，完成后也退出。
 [self.timer invalidate];
 }
 NSLog(@"do timer task count:%d",self.count);
}

- (void)testUrl {
    NSString *urlstr = @"https://linkst.m.jd.com/ul/ul.action?openApp.jdMobile://virtual?params=%7B%22SE%22%3A%22ADC_ywTpLbYtSAgLqU%2B9XThDVaYe3V%2F00p%2Bc87KvKXB5PjdobvKNns7%2FkmObCZUUyRpdoo1z4gAc9dDYArHS8G8YMNRzOexebJZuyjVz8jBmhbm0eVU5n3XHA8OZbh3DBudSNdwPKQfOnlBaFp37HiEqtZa6WQOKzXRrsCYBgksdVIA%3D%22%2C%22action%22%3A%22to%22%2C%22category%22%3A%22jump%22%2C%22des%22%3A%22getCoupon%22%2C%22ext%22%3A%22%7B%5C%22ad%5C%22%3A%5C%222598%5C%22%2C%5C%22ch%5C%22%3A%5C%223%5C%22%2C%5C%22shop%5C%22%3A%5C%22179479%5C%22%2C%5C%22ts%5C%22%3A%5C%221590455706%5C%22%2C%5C%22uniqid%5C%22%3A%5C%22%7B%5C%5C%5C%22material_id%5C%5C%5C%22%3A%5C%5C%5C%222158286058%5C%5C%5C%22%2C%5C%5C%5C%22pos_id%5C%5C%5C%22%3A%5C%5C%5C%222598%5C%5C%5C%22%2C%5C%5C%5C%22sid%5C%5C%5C%22%3A%5C%5C%5C%22111_27257a2839f7433b80f628db2e45b47c_1%5C%5C%5C%22%7D%5C%22%7D%22%2C%22kepler_param%22%3A%7B%22channel%22%3A%222e3b9ecfb3a1465badbbbeb48df4140c%22%2C%22source%22%3A%22kepler-open%22%7D%2C%22locationHref%22%3A%22https%3A%2F%2Fccc-x.jd.com%2Fdsp%2Fnc%3Fext%3DaHR0cHM6Ly9zaG9wLm0uamQuY29tLz9zaG9wSWQ9MTc5NDc5JnV0bV9zb3VyY2U9cGRhcHB3YWtldXB1cF8yMDE3MDAwMiZQVEFHPTE3MDUxLjkuMSZhZF9vZD0x%26log%3DGyPFQwO04WPq225YjLm7qmIeA-hzZ2lEZltgznDgmfV1uujOT7w1Fa2TNJxy3teMVHO8KFXwKdtj5YE3o62jsU1jxc6esgPBReuaAxDq7dbFs0sn2dSyDzFzxiiUNwnYwFdldLHJU4yiD_9w8MRcpgBGjTxziY_KwaXv3HnQjC1_5u6XfE6wvmxkpyCfXoqi1JN9tfMPAMbdia729XCPt-EN9AtJDPdhgEQSf9e3_0ZgrHc1Da1PyxMhrafsoGfPsMQTmilJs-TdTwra5LplVjOnFtSKtUMO2da-EJSIKQXgGlteJTmkw4Yxw36tzhH8oXEDRsHuAy0LapH5LAbvk7oA3YFbWbCQxgThMRbW00qlQ0E_dxxSYROHpQcJ8bv6Sj0wRoV2FsrvNKlYBThgob8rwFpVYwy8sTHfpmFNnF2Q3IvAj64lJSDpg5Cn3x6gTMWOxQmClZsC8qjI4XtWoDTL2OB8pq3XSaULYkyeMf49yB3KakGfl3grCvTjsHlonMICvNn1qgiTkPUIybhUP9A3v0GYPqMI9zF6kdbLdQUFGi23xuHO9a7OJsNv9H3QAn2I8YVpx4HSi5prqZrC4sUloTAh92mGP9Le2lZrzhGP6qkVcSOUWOVtY4qb0Dzi%26v%3D404%22%2C%22m_param%22%3A%7B%22jdv%22%3A%22238571484%7Crgyun%7Ct_1000113567_2158286058_2598%7Cadrealizable%7C_2_app_0_34b1d06f93e442ca8b6271eeb20ccf23-p_2598%22%7D%2C%22sourceType%22%3A%22adx%22%2C%22sourceValue%22%3A%22rgyun_111%22%2C%22url%22%3A%22https%3A%2F%2Fccc-x.jd.com%2Fdsp%2Fnc%3Fext%3DaHR0cHM6Ly9zaG9wLm0uamQuY29tLz9zaG9wSWQ9MTc5NDc5JnV0bV9zb3VyY2U9cGRhcHB3YWtldXB1cF8yMDE3MDAwMiZQVEFHPTE3MDUxLjkuMSZhZF9vZD0x%26log%3DGyPFQwO04WPq225YjLm7qmIeA-hzZ2lEZltgznDgmfV1uujOT7w1Fa2TNJxy3teMVHO8KFXwKdtj5YE3o62jsU1jxc6esgPBReuaAxDq7dbFs0sn2dSyDzFzxiiUNwnYwFdldLHJU4yiD_9w8MRcpgBGjTxziY_KwaXv3HnQjC1_5u6XfE6wvmxkpyCfXoqi1JN9tfMPAMbdia729XCPty_1mShgPZg53t-3WIblzqiRNwkypr4yrMUbOpTSKfth8GimBoblkJzRVY-Qfc2A4otbPr1tugHi5euLuB709pPCHPRm7U6k0tEDX_dnB2-7FmsoW0CD9sXqfGwLFNL-GIjEkfqYuOO1KKiABVywMuYMOyGp-UDst08Sf3B9JunmxKEZLeZhOhvjAEUox8uru6zJfvnyrEKeIQ3piMhmrxeSy-cpEJPMD3QtSbBacdaWgRF5Apb5wBPuHhw1Pzho0yB5l3_UWLqGGriXEZdpnlibK3U8VR764bBKZ_5reBZcq-UlU2OtX9887GJajTdMeygfVkCx85Qe8gTKOHHMALpwJeTPhkGytU5JB1qXdUnbGapns3ARRe7TWnZyGVOsy8fQoen9asgkJG9ixcPYzIaq2_oqVZBkBjkd6X0PWKz0y2tJq-JAiD-nziMaQFOsurItxAKvlr0IomK4bSFik3M%26v%3D404%26SE%3D1%22%7D%0A";
    NSURL *url = [NSURL URLWithString:urlstr];
    
    NSLog(@"===> %@\nhoast=%@",url,url.host);
}
// 数组遍历是否在主线程
- (void)testEnumerateBlock {
    NSArray *array = @[@"1",@"2",@"3"];
    NSMutableString *num = [NSMutableString stringWithString:@"n"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [num appendString:obj];
            NSLog(@"block Thread: %@",[NSThread currentThread]); // 子线程
        }];
    });
    NSLog(@"%@",num);

    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [num appendString:obj];
        NSLog(@"block Thread: %@",[NSThread currentThread]); // 主线程
    }];
    NSLog(@"%@",num);
}

- (void)testProperty {
    /*
     把可变字符串赋值给带copy修饰的字符串属性(字符串属性是可变字符串或不可变字符串均可)时，是做了深度拷贝的。(但是得到的仍是不可变字符串)
     把不可变字符串赋值给带copy修饰的字符串属性(字符串属性是可变字符串或不可变字符串均可)时，是做了浅拷贝的。
     */
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"Tom"];
    Person *person = [[Person alloc]init];
    person.name = str; // name做了深拷贝，但是得到的仍是不可变字符串
    
    [str appendString:@"6"];
//    [person.name appendString:@"and Jerry"]; // crash !
    
    NSLog(@"\n%@\n%@", str, person.name);
    NSLog(@"\n%p\n%p", str, person.name);

}

- (void)base64Image {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSDictionary *params = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];

    NSString *imageBase64 = [params objectForKey:@"topic_post_image"];
    NSData *decodedImageData  = imageBase64?[[NSData alloc] initWithBase64EncodedString:imageBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters]:nil;
    UIImage *image = decodedImageData?[UIImage imageWithData:decodedImageData]:nil;
    NSLog(@"image:%@",image);

}

-(void)testPredicate {
//    NSString *regex = @"^d.+g$";
    NSString *regex = @"^7567.*$";

//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF LIKE %@",regex];

//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^d.+g$'"];
//    BOOL isMatch = [predicate evaluateWithObject:@"dog"];
    
    NSString *searchText = @"75629819";
    BOOL isMatch = [self hitWithPattern:regex value:searchText];
    
    NSLog(@"isMatch=%d",isMatch);

}

- (BOOL)hitWithPattern:(NSString *)pattern value:(NSString *)value {
    NSRange range = [value rangeOfString:pattern options:NSRegularExpressionSearch];
    return range.location!=NSNotFound;
    
//    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
//    NSInteger count = [regex numberOfMatchesInString:value options:NSMatchingReportProgress range:NSMakeRange(0, value.length)];
////    NSTextCheckingResult *r = [regex firstMatchInString:value options:NSMatchingReportProgress range:NSMakeRange(0, value.length)];
//    BOOL result = count>0 ? YES : NO;
//    return result;
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

- (void)nextAction {
    NextViewController *next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}
@end
