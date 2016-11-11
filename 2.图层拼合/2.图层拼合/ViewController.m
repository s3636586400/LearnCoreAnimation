//
//  ViewController.m
//  ImageSprites
//
//  Created by s3636586400 on 2016/11/7.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import "ViewController.h"

//CALayer contentsRect属性可以取图片上指定的范围
//所以可以把多个小图拼为一张大图，通过该属性取回小图
//载入一张大图比多张小图优点：省内存，省载入时间，省渲染时间
@interface ViewController ()

@property (strong, nonatomic) UIImage *originImage;
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.container.layer.contents = (__bridge id)(self.originImage.CGImage);
    self.container.layer.contentsGravity = kCAGravityResizeAspect;
}


- (IBAction)random:(id)sender {
    NSInteger index = arc4random() % 10;
    NSLog(@"%ld",index);
    CGFloat x = index % 5;
    CGFloat y = index / 5;
    CGFloat width = 1.0 / 5;
    CGFloat height = 1.0 / 2;
    self.container.layer.contentsRect = CGRectMake(x * width, y * height, width, height);
}

- (UIImage *)originImage {
    if (!_originImage) {
        _originImage = [UIImage imageNamed:@"emoji"];
    }
    return _originImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
