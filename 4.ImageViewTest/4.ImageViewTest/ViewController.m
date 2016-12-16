//
//  ViewController.m
//  4.ImageViewTest
//
//  Created by s3636586400 on 2016/11/15.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIImageView就是把图片设置为UIImageView的CALayer的寄宿图
    UIImage *image = [UIImage imageNamed:@"POI"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    id contents = imageView.layer.contents;
    printf("%p\n%p",contents,image.CGImage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
