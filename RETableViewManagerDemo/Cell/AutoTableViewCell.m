//
//  AutoTableViewCell.m
//  RETableViewManagerDemo
//
//  Created by steven on 2018/8/2.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "AutoTableViewCell.h"

@interface AutoTableViewItem ()

@end

@implementation AutoTableViewItem
- (id)init{
    if (self = [super init]) {

        //self.cellHeight = 0;
        //self.cellHeight = UITableViewAutomaticDimension;
        //或不写
    }
    return self;
}
@end


@interface AutoTableViewCell ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation AutoTableViewCell
@dynamic item;

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.layer.cornerRadius = 5;
    bgView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:bgView];
    self.bgView = bgView;
    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).inset(10);
    }];
    
    //  动态计算cell高度，可以使用Mansory
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
