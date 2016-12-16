//
//  ViewController.m
//  3.CALayerDelegate
//
//  Created by s3636586400 on 2016/11/11.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import "ViewController.h"
#import "MIView.h"

@interface ViewController ()<CALayerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self layerTest];
    
    [self layerDelegateTest];
    
}

- (void)layerTest {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CALayer *layer = [CALayer layer];
    //CALayer没有Center？Center是UIView拿frame包出来的属性吧？
    layer.frame = CGRectMake(width / 2 - 50, height / 2 - 50, 100, 100);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.delegate = self;
    layer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:layer];
    
    //layer不被显示调用是不会显示的
    [layer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    printf("%s",__func__);
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

#if 0
//重写了该方法，drawLayer:inContext:就不会走了
//也就是CALayer取寄宿图时，该方法的优先级比上边那个方法高
- (void)displayLayer:(CALayer *)layer {
    
}
#endif

- (void)layerDelegateTest {
    MIView *view = [[MIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.center = self.view.center;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
