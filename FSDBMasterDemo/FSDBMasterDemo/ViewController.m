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
    [self insertNewFunction];
}

- (void)insertNewFunction{
    FSDBMaster *master = FSDBMaster.sharedInstance;
    NSString *path = master.dbPath;
    NSLog(@"%@",path);
    
    NSString *error = [master hi_insert_fields_values:@{@"a":@"1",@"b":@"10",@"c":@"100"} table:@"kfc"];
    if (error) {
        NSLog(@"error：%@",error);
    }
    
    NSString *select = @"select * from kfc";
    NSArray *list = [master querySQL:select tableName:@"kfc"];
    NSLog(@"%@",list);
}

- (void)clickA{
    NSString *path = [FSDBMaster sharedInstance].dbPath;
    NSLog(@"%@",path);
    
    UIImage *image = [UIImage imageNamed:@"tp.jpg"];
    NSData *data = UIImageJPEGRepresentation(image, 1);
    FSDBMaster *master = FSDBMaster.sharedInstance;
    NSString *error = [master insertData:data table:@"image1" key:NSStringFromClass(self.class)];
    if (error) {
        NSLog(@"%@",error);
    }
    
    NSString *select = @"select * from image1";
    NSArray *list = [master querySQL:select tableName:@"image1"];
    for (int x = 0; x < list.count; x ++) {
        NSDictionary *d = list[x];
        NSData *data = [d objectForKey:@"dt"];
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(100,160 + 50 * x, 50, 50);
        [self.view addSubview:imageView];
    }
}

@end
