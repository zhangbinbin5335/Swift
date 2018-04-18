#!/bin/sh

#  NodeService.sh
#  ZBBLearnSwift
#
#  Created by 张彬彬 on 2018/4/16.
#  Copyright © 2018年 zhangbinbin. All rights reserved.

# 杀掉node服务进程
pkill -9 node
#取得当前path
path=$(pwd);

cd ../node

# 开启服务进程
node index.js
