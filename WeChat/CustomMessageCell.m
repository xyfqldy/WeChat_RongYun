//
//  CustomMessageCell.m
//  WeChat
//
//  Created by I_MT on 16/9/9.
//  Copyright © 2016年 I_MT. All rights reserved.
//

#import "CustomMessageCell.h"

@implementation CustomMessageCell
- (IBAction)clickAction:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            
            break;
        case 2:
        
            break;
        default:
            break;
    }
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize {
    self.messageContentView.backgroundColor=[UIColor yellowColor];
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(40, 40, 40, 40)];
    btn1.backgroundColor= [UIColor redColor];
    [self.messageContentView addSubview:btn1];
    [btn1 addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    UILongPressGestureRecognizer *longPress =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    [self.messageContentView addGestureRecognizer:longPress];
}
-(void)tapAction{
    [self.delegate didTapMessageCell:self.model];
}
- (void)setDataModel:(RCMessageModel *)model {
    [super setDataModel:model];
     
}
- (UIImage *)imageNamed:(NSString *)name ofBundle:(NSString *)bundleName {
    UIImage *image = nil;
    NSString *image_name = [NSString stringWithFormat:@"%@.png", name];
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:bundleName];
    NSString *image_path = [bundlePath stringByAppendingPathComponent:image_name];
    image = [[UIImage alloc] initWithContentsOfFile:image_path];
    
    return image;
}

- (void)longPressed:(id)sender {
    UILongPressGestureRecognizer *press = (UILongPressGestureRecognizer *)sender;
    if (press.state == UIGestureRecognizerStateEnded) {
        //DebugLog(@”long press end”);
        return;
    } else if (press.state == UIGestureRecognizerStateBegan) {
        [self.delegate didLongTouchMessageCell:self.model inView:self.messageContentView];
    }
}
@end
