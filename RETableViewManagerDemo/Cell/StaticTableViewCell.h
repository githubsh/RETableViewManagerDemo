//
//  StaticTableViewCell.h
//  RETableViewManagerDemo
//
//  Created by steven on 2018/8/2.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "RETableViewManager.h"
#import "TestModel.h"

@interface StaticTableViewItem : RETableViewItem
@property (nonatomic, strong) TestModel *model;
@end

@interface StaticTableViewCell : RETableViewCell
@property (nonatomic, strong) StaticTableViewItem *item;
@end
