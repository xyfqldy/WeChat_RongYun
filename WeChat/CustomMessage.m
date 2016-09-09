//
//  CustomMessage.m
//  WeChat
//
//  Created by I_MT on 16/9/9.
//  Copyright © 2016年 I_MT. All rights reserved.
//

#import "CustomMessage.h"

@implementation CustomMessage
-(NSData *)encode{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:self.name forKey:@"name"];
    NSData *data =[NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    return data;
}
-(void)decodeWithData:(NSData *)data{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.name = dict [@"name"];
}
+(NSString *)getObjectName{
    return @"custom";
}
+(RCMessagePersistent)persistentFlag{
    return  MessagePersistent_ISCOUNTED;
}
-(NSString *)conversationDigest{
    return @"约战";
}
@end
