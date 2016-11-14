//
//  MIView.m
//  3.CALayerDelegate
//
//  Created by s3636586400 on 2016/11/14.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import "MIView.h"

@implementation MIView

- (void)displayLayer:(CALayer *)layer {
    printf("%s\n",__func__);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    printf("%s\n",__func__);
}

- (void)layerWillDraw:(CALayer *)layer {
    printf("%s\n",__func__);
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    printf("%s\n",__func__);
}

- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    printf("%s event:%s\n",__func__,[event cStringUsingEncoding:NSUTF8StringEncoding]);
    return [super actionForLayer:layer forKey:event];
}

- (void)drawRect:(CGRect)rect {
    
}

@end
