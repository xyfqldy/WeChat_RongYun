//
//  CustomMessage.h
//  WeChat
//
//  Created by I_MT on 16/9/9.
//  Copyright © 2016年 I_MT. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <RongIMLib/RCMessageContent.h>

@interface CustomMessage :RCMessageContent<RCMessageCoding,RCMessagePersistentCompatible,RCMessageContentView>
@property (nonatomic,copy)NSString *name;

@end
