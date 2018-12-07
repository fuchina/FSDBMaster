//
//  ViewController.m
//  FSDBMasterDemo
//
//  Created by fudongdong on 2018/12/7.
//  Copyright © 2018年 fudongdong. All rights reserved.
//

#import "ViewController.h"
#import "FSDBMaster.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 100, UIScreen.mainScreen.bounds.size.width - 20, 50)];
    view.backgroundColor = UIColor.brownColor;
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [view addGestureRecognizer:tap];
}

- (void)click{
    NSString *path = [FSDBMaster sharedInstance].dbPath;
    NSLog(@"%@",path);
    
    UIImage *image = [UIImage imageNamed:@"tp.jpg"];
    NSData *data = UIImageJPEGRepresentation(image, 1);
    NSString *error = [[FSDBMaster sharedInstance] insertData:data table:@"image" key:NSStringFromClass(self.class)];
    if (error) {
        NSLog(@"%@",error);
    }
}

@end
