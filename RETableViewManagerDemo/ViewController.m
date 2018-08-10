//
//  ViewController.m
//  RETableViewManagerDemo
//
//  Created by steven on 2018/8/2.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "ViewController.h"

#import "StaticTableViewCell.h"
#import "AutoTableViewCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define SafeAreaTopHeight (ScreenHeight == 812.0 ? 88 : 64)

@interface ViewController ()

@property (nonatomic, strong) NSArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RETableViewManagerDemo";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] init];
    seg.bounds = CGRectMake(0, 0, ScreenWidth, 20);
    [seg insertSegmentWithTitle:@"cell高度固定" atIndex:0 animated:NO];
    [seg insertSegmentWithTitle:@"cell高度动态" atIndex:1 animated:NO];
    [seg insertSegmentWithTitle:@"带headerView" atIndex:2 animated:NO];
    [seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = seg;
    
    //  配置tableView
    self.formTable.backgroundColor = [UIColor whiteColor];
    [self.formTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.view).offset(SafeAreaTopHeight);
    }];
    
    //  请求数据
    [self requestData];
    
    //  刷新第一个表格
    seg.selectedSegmentIndex = 0;
    [self refreshTableView0];
}

- (void)requestData {
    
    TestModel *model1 = [[TestModel alloc] init];
    model1.name = @"你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好";
    
    TestModel *model2 = [[TestModel alloc] init];
    model2.name = @"hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello";
    
    TestModel *model3 = [[TestModel alloc] init];
    model3.name = @"萨瓦迪卡";
    
    self.dataArray = @[model1, model2, model3];
}

- (void)segClick:(UISegmentedControl *)seg {
    if (seg.selectedSegmentIndex == 0) {
        [self refreshTableView0];
    } else if (seg.selectedSegmentIndex == 1) {
        [self refreshTableView1];
    } else if (seg.selectedSegmentIndex == 2) {
        [self refreshTableView2];
    }
}

- (void)refreshTableView0 {
    //  注册Item和Cell
    self.formManager[@"StaticTableViewItem"] = @"StaticTableViewCell";
    
    //  创建SectionArray
    NSMutableArray *sectionArray = [NSMutableArray array];
    
    //  创建Section
    RETableViewSection *section = [RETableViewSection section];
    
    //  Section添加Items
    for (TestModel *model in self.dataArray) {
        StaticTableViewItem *staticItem = [[StaticTableViewItem alloc] init];
        staticItem.model = model;
        staticItem.selectionHandler = ^(StaticTableViewItem * item) {
            NSLog(@"indexPath = %@", item.indexPath);
        };
        [section addItem:staticItem];
    }

    //  SectionArray 添加数据
    [sectionArray addObject:section];
    
    //  刷新FormManager的数据源
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    //  刷新表格
    [self.formTable reloadData];
}

- (void)refreshTableView1 {
   
    [self registerItemClass:AutoTableViewItem.class forCellClass:AutoTableViewCell.class];
    
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section = [RETableViewSection section];
    for (TestModel *model in self.dataArray) {
        AutoTableViewItem *autoItem = [[AutoTableViewItem alloc] init];
        autoItem.model = model;
        autoItem.selectionHandler = ^(AutoTableViewItem * item) {
            NSLog(@"点击了 %@", item.model.name);
        };
        [section addItem:autoItem];
    }
    [sectionArray addObject:section];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}

- (void)refreshTableView2 {
    self.formManager[@"StaticTableViewItem"] = @"StaticTableViewCell";
    [self registerItemClass:AutoTableViewItem.class forCellClass:AutoTableViewCell.class];
    
    NSMutableArray *sectionArray = [NSMutableArray array];
    
    //  分区0
    RETableViewSection *section0 = [RETableViewSection section];

    UILabel *headerView0 = [[UILabel alloc] init];
    headerView0.backgroundColor = [UIColor lightGrayColor];
    headerView0.text = @"section0 表头";
    section0.headerView = headerView0;
    section0.headerHeight = 20;
    
    RETableViewItem *item0 = [[RETableViewItem alloc] init];
    item0.title = @"你好";
    [section0 addItem:item0];
    
    RETableViewItem *item1 = [[RETableViewItem alloc] init];
    item1.title = @"Hello";
    [section0 addItem:item1];
    
    //  分区1
    RETableViewSection *section1 = [RETableViewSection section];
    
    UILabel *headerView1 = [[UILabel alloc] init];
    headerView1.backgroundColor = [UIColor lightGrayColor];
    headerView1.text = @"section1 表头";
    section1.headerView = headerView1;
    section1.headerHeight = 20;
    
    for (TestModel *model in self.dataArray) {
        StaticTableViewItem *item = [[StaticTableViewItem alloc] init];
        item.model = model;
        item.selectionHandler = ^(StaticTableViewItem * item) {
            NSLog(@"点击了 %@", item.model.name);
        };
        [section1 addItem:item];
    }
    
    //  分区2
    RETableViewSection *section2 = [RETableViewSection section];
    
    UILabel *headerView2 = [[UILabel alloc] init];
    headerView2.backgroundColor = [UIColor lightGrayColor];
    headerView2.text = @"section2 表头";
    section2.headerView = headerView2;
    section2.headerHeight = 20;
    
    for (TestModel *model in self.dataArray) {
        AutoTableViewItem *item = [[AutoTableViewItem alloc] init];
        item.model = model;
        item.selectionHandler = ^(AutoTableViewItem * item) {
            NSLog(@"点击了 %@", item.model.name);
        };
        [section2 addItem:item];
    }
    
    [sectionArray addObject:section0];
    [sectionArray addObject:section1];
    [sectionArray addObject:section2];
    
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}

@end
