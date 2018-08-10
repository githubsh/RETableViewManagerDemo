//
//  BaseFormViewController.m
//  RETableViewManagerDemo
//
//  Created by steven on 2018/8/2.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "BaseFormViewController.h"

@interface BaseFormViewController ()<RETableViewManagerDelegate>
@end

@implementation BaseFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.formTable];
    self.formManager.style.cellHeight = UITableViewAutomaticDimension;//设置可以动态计算cell高度
    
    if (@available(iOS 11.0, *)) {
        self.formTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (UITableView *)formTable {
    if (_formTable) {
        return _formTable;
    }
    
    _formTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _formTable.tableHeaderView = [[UIView alloc] init];
    _formTable.tableFooterView = [[UIView alloc] init];
    _formTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    return _formTable;
}

- (RETableViewManager *)formManager {
    if (_formManager) {
        return _formManager;
    }
    
    _formManager = [[RETableViewManager alloc] initWithTableView:self.formTable];
    _formManager.delegate = self;
    
    return _formManager;
}

- (void)registerItemClass:(Class)itemClass forCellClass:(Class)cellClass {
    
    [self.formManager registerClass:NSStringFromClass(itemClass) forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

#pragma mark - RETableViewManagerDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView willLayoutCellSubviews:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)tableView:(UITableView *)tableView willLoadCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)tableView:(UITableView *)tableView didLoadCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
