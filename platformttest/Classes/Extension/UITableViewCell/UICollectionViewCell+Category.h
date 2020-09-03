//
//  UICollectionViewCell+Category.h
//  IFAClub
//
//  Created by zhangmen on 2018/9/3.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Category)

// MARK: 注册 cell
+ (void)registerWith:(UICollectionView *)collectionView;
// MARK: 获取 cell
+ (instancetype)getCellWith:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
// MARK: 获取 去重用 cell
+ (instancetype)getNoReuseCellWith:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
