//
//  UITableViewCell+Category.h
//  IFAClub
//
//  Created by zhangmen on 2018/9/3.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Category)

// MARK: 注册 cell
+ (void)registerWith:(UITableView *)tableView;
// MARK: 获取 cell
+ (instancetype)getCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
