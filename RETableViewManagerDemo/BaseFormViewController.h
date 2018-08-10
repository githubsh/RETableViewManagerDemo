//
//  BaseFormViewController.h
//  RETableViewManagerDemo
//
//  Created by steven on 2018/8/2.
//  Copyright © 2018年 steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "RETableViewManager.h"

@interface BaseFormViewController : UIViewController

@property (nonatomic, strong) UITableView *formTable;
@property (nonatomic, strong) RETableViewManager *formManager;

- (void)registerItemClass:(Class)itemClass forCellClass:(Class)cellClass;

@end
