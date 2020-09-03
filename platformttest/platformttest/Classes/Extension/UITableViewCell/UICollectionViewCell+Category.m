//
//  UICollectionViewCell+Category.m
//  IFAClub
//
//  Created by zhangmen on 2018/9/3.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import "UICollectionViewCell+Category.h"

@implementation UICollectionViewCell (Category)

#pragma mark - methods
// MARK: 注册 cell
+ (void)registerWith:(UICollectionView *)collectionView
{
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:[self getIdentifier]];
}
// MARK: 获取 cell
+ (instancetype)getCellWith:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:[self getIdentifier] forIndexPath:indexPath];
}
// MARK: 获取 去重用 cell
+ (instancetype)getNoReuseCellWith:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [NSString stringWithFormat:@"%@_%@_%@",[self getIdentifier],@(indexPath.item),@(indexPath.row)];
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:cellIdentifier];
    return [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
}
// MARK: cellIdentifier
+ (NSString *)getIdentifier
{
    return [NSString stringWithFormat:@"CellIdentifier_%@", NSStringFromClass([self class])];
}

@end
