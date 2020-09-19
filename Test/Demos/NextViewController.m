//
//  NextViewController.m
//  Demos
//
//  Created by HK on 2020/9/18.
//  Copyright © 2020 HK. All rights reserved.
//

#import "NextViewController.h"
#import "UIViewController+tool.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showAnAlert:@"will"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showAnAlert:@"Did"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self showAnAlert:@"pop"];
    NSLog(@"==viewWillDisappear==");
}

- (void)showAnAlert:(NSString *)title {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:@"hahahaha" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"action called !");
    }];
    [alertController addAction:action];
    [[UIViewController currentViewController] presentViewController:alertController animated:YES completion:^{
        NSLog(@"--- did show alert");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
