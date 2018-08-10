//
//  StaticTableViewCell.m
//  RETableViewManagerDemo
//
//  Created by steven on 2018/8/2.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "StaticTableViewCell.h"

#define CellHeight 60.

@interface StaticTableViewItem ()

@end

@implementation StaticTableViewItem
- (id)init{
    if (self = [super init]) {
        //cell高度固定
        self.cellHeight = CellHeight;
        
        //cell样式设置...
        self.selectionStyle = UITableViewCellSelectionStyleDefault;//选择样式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//右边的箭头
    }
    return self;
}
@end


@interface StaticTableViewCell ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation StaticTableViewCell
@dynamic item;

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:220./255 green:220./255 blue:220./255 alpha:1];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.layer.cornerRadius = 5;
    bgView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:bgView];
    self.bgView = bgView;
    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).inset(10);
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.numberOfLines = 0;
    nameLabel.backgroundColor = [UIColor redColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor blueColor];
    [self.bgView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView).inset(5);
    }];
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.nameLabel.text = self.item.model.name;
}

@end
