//
//  BounceOutRightAnimation.m
//  TTAnimationExample
//
//  Created by titengjiang on 16/1/19.
//  Copyright © 2016年 sloop. All rights reserved.
//

#import "BounceOutRightAnimation.h"

@implementation BounceOutRightAnimation

-(void)start{
    
    NSArray<NSNumber *> *keyTimes =  @[@0,@0.2,@1];
    CAKeyframeAnimation * transformAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    transformAnimation.keyTimes = keyTimes;
    
    CATransform3D originTransform = _targetView.layer.transform;
    NSMutableArray * values = [[NSMutableArray alloc] init];
    
    [@[@0,@-20,@2000]enumerateObjectsUsingBlock:
     ^(NSNumber * obj, NSUInteger idx, BOOL * _Nonnull stop) {
         
         [values addObject:[NSValue valueWithCATransform3D:CATransform3DTranslate(originTransform, [obj floatValue], 0, 0)]];
         
     }];
    transformAnimation.values = values;
    
    
    //opacity animation
    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.keyTimes =keyTimes;
    opacityAnimation.values = @[@1,@1,@0];
    
    //
    CAAnimationGroup * animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[transformAnimation,opacityAnimation];
    animationGroup.delegate= self;
    animationGroup.duration = _params.duration;
    animationGroup.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [_targetView.layer addAnimation:animationGroup forKey:@""];
}

@end
