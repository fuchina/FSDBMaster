//
//  ViewController.m
//  FSDBMasterSample
//
//  Created by FudonFuchina on 2018/11/24.
//  Copyright © 2018年 FudonFuchina. All rights reserved.
//

#import "ViewController.h"
#import <FSDBMaster.h>
//#import <FSKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[btn]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[btn(44)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)]];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)click{
//    [FSKit pushToViewControllerWithClass:@"FSSQLite3Controller" navigationController:self.navigationController param:nil configBlock:nil];
    
    //    FSSecondController *vc = [[FSSecondController alloc] init];
    //    [vc setText:@"我不会出现"];
    //    [self.navigationController pushViewController:vc animated:YES];
}


@end
