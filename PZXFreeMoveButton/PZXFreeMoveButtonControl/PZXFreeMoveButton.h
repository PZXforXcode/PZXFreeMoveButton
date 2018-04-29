//
//  PZXFreeMoveButton.h
//  PZXFreeMoveButton
//
//  Created by 贤若 on 2018/4/29.
//  Copyright © 2018年 贤若. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PZXFreeMoveButton : UIImageView

-(void)setAction:(NSString*)action;

-(void)setActionBlock:(void(^)(void))block; 

@end
