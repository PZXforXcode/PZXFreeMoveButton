//
//  PZXFreeMoveButton.m
//  PZXFreeMoveButton
//
//  Created by 贤若 on 2018/4/29.
//  Copyright © 2018年 贤若. All rights reserved.
//

#import "PZXFreeMoveButton.h"

@interface PZXFreeMoveButton(){
    
    CGPoint startLocation;
    NSString *_action;
    void(^_actionBlock)(void);
    CGRect _frame;

    
}

@end

@implementation PZXFreeMoveButton

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMe)];
        [self addGestureRecognizer:tap];
        _frame  = frame;
        
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width, _frame.size.height)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14.f];
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    CGPoint pt = [[touches anyObject] locationInView:self];
    startLocation = pt;
    [[self superview] bringSubviewToFront:self];
}

-(void)setTitleLabel:(UILabel *)titleLabel{
    
    _titleLabel = titleLabel;
}

-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    CGPoint pt = [[touches anyObject] locationInView:self];
    float dx = pt.x - startLocation.x;
    float dy = pt.y - startLocation.y;
    CGPoint newcenter = CGPointMake(self.center.x + dx, self.center.y + dy);
    //
    float halfx = CGRectGetMidX(self.bounds);
    newcenter.x = MAX(halfx, newcenter.x);
    newcenter.x = MIN(self.superview.bounds.size.width - halfx, newcenter.x);
    //
    float halfy = CGRectGetMidY(self.bounds);
    newcenter.y = MAX(halfy, newcenter.y);
    newcenter.y = MIN(self.superview.bounds.size.height - halfy, newcenter.y);
    //
    self.center = newcenter;
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = self.center;
    if (point.x>[self superview].frame.size.width/2.0) {
        [UIView animateWithDuration:0.2 animations:^{
            
//            self.frame.origin.x = ;

            self.frame = CGRectMake([self superview].frame.size.width-self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
            
        }];
    }else{
        [UIView animateWithDuration:0.2 animations:^{

            self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        }];
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)tapMe {
    
//    debugLog(@"touch float icon ....");
//    if (![NSString IsNullOrWhiteSpace:_action]) {
//        //注：这里我删掉两行跟业务有关的代码
//    }
    
    if(_actionBlock){ _actionBlock(); }
}

-(void)setAction:(NSString *)action {
    _action = action;
}

-(void)setActionBlock:(void (^)(void))block {
    _actionBlock = block;
}
@end
