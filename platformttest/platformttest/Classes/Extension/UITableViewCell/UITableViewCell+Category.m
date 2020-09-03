//
//  UITableViewCell+Category.m
//  IFAClub
//
//  Created by zhangmen on 2018/9/3.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import "UITableViewCell+Category.h"

@implementation UITableViewCell (Category)

#pragma mark - methods
// MARK: 注册 cell
+ (void)registerWith:(UITableView *)tableView
{
    [tableView registerClass:[self class] forCellReuseIdentifier:[self getIdentifier]];
}
// MARK: 获取 cell
+ (instancetype)getCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:[self getIdentifier] forIndexPath:indexPath];;
}
// MARK: cellIdentifier
+ (NSString *)getIdentifier
{
    return [NSString stringWithFormat:@"CellIdentifier_%@", NSStringFromClass([self class])];
}

@end
