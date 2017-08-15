//
//  ViewController.m
//  HYFloatingWindow
//
//  Created by 杨小雨 on 2017/8/15.
//  Copyright © 2017年 杨小雨. All rights reserved.
//

#import "ViewController.h"
#import "HYFloatingWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HYFloatingWindow *view = [[HYFloatingWindow alloc] initWithFrame:CGRectMake(10, 10, 120, 150)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
