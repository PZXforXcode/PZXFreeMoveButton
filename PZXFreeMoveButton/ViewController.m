//
//  ViewController.m
//  PZXFreeMoveButton
//
//  Created by 贤若 on 2018/4/29.
//  Copyright © 2018年 贤若. All rights reserved.
//

#import "ViewController.h"
#import "PZXFreeMoveButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PZXFreeMoveButton *button = [[PZXFreeMoveButton alloc]initWithFrame:CGRectMake(0,200, 60, 60)];
    
    button.backgroundColor = [UIColor cyanColor];
//    button
    button.titleLabel.text = @"点击";
    [button setActionBlock:^{
        
        NSLog(@"tap");
        
    }];
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
