//
//  ViewController.m
//  1.寄宿图
//
//  Created by s3636586400 on 2016/10/11.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self contents];
    [self customDrawing];
}

//CALayer类可以包含一个图片（寄宿图）
- (void)contents {
    
    //1.通过Contents属性-类型为CGImage(iOS)或NSImage(Mac OS)
    UIImage *image = [UIImage imageNamed:@"POI"];
    self.view.layer.contents = (__bridge id)image.CGImage;
    
    //2.设置对其方式
    self.view.layer.contentsGravity = kCAGravityCenter;
    
    //3.拉伸-对其方式设置为拉伸时，该属性无效
    //注:这个值是屏幕的一个逻辑像素对应图片多少物理像素：例如设置为2.0，就是缩小了一倍。设置为0.5是放大了一倍
    self.view.layer.contentsScale = 2.0;
    
    //UIImage在读取图片时，会根据设备读取对应图片(2x 3x图)，CGImage设置寄宿图时，不会自动匹配的。所以需要手动设置下contentsScale：(否则Retina设备会默认读取低像素图片)
    self.view.layer.contentsScale = [UIScreen mainScreen].scale;
    
    //4.maskToBounds:裁剪子视图，等价于UIView的clipsToBounds
    
    //5.contentsRect
    self.view.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    //6.contentsCenter:就是Stretching拉伸
}

//设置寄宿图另一种方式：drawRect方法中自己画，画出来的东西还是给视图分配了一个寄宿图，寄宿图显示我们画出来的东西。
//以iPhone6 scale为2来算，一个寄宿图物理像素为(375 * 2,667 * 2),RGBA颜色空间下，一个像素占4个字节，寄宿图占375 * 2 * 667 * 2 * 4 = 3908K，也就是每次调用drawRect需要花费将近4M的内存开销（）
//虽然drawRect绘制的寄宿图会有缓存的,还是drawRect很耗资源，所以不要写空的drawRect方法。


//手动调用UIView的setNeedsDisplay会触发drawRect方法。修改bounds也会触发。
- (void)customDrawing {
    printf("%p\n",self.view);
    printf("%p\n",self.view.layer.delegate);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
