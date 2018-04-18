//
//  ZBBRunShellManager.m
//  ZBBRunShell
//
//  Created by 张彬彬 on 2018/4/16.
//  Copyright © 2018年 zhangbinbin. All rights reserved.
//

#import "ZBBRunShellManager.h"
#include <stdlib.h>

@implementation ZBBRunShellManager

+ (void)startService{
    NSString *shPath = [[NSBundle bundleForClass:NSClassFromString(@"ZBBRunShell")]
                        pathForResource:@"NodeService" ofType:@"sh"];
    NSString *cmd = [NSString stringWithFormat:@"bash %@",shPath];
    
    char buffer[80];
    FILE  *fp = popen([cmd UTF8String],"r");
    fgets(buffer,sizeof(buffer),fp);
    printf("%s",buffer);
    pclose(fp);
}

@end
