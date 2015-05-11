//
//  MZ-Home-RefreshFoot-V.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 22/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-RefreshFoot-V.h"

@implementation MZ_Home_RefreshFoot_V

+ (instancetype)refreshFootView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"MZ-Home-RefreshFoot-V" owner:nil options:nil]lastObject];
}

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
}

@end
