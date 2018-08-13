# RETableViewManagerDemo

#### 项目介绍

RETableViewManagerDemo

RETableViewManager 是一个数据驱动快速搭建TableView的MVC框架，方便我们快速使用TableView进行UI开发。。

RETableViewManager OC版
[https://github.com/romaonthego/RETableViewManager](https://github.com/romaonthego/RETableViewManager) 

(由于作者好久没有更新了，项目比较老了，这里建议大家使用我们这个项目中更新过的源码，持续更新优化中..)

#### 兼容性
项目使用Xcode9.4编译，实测支持iOS8.0及以上

#### 框架类 继承关系

![RETableViewManager](https://images.gitee.com/uploads/images/2018/0803/115734_1372f3cf_788335.jpeg "RETableViewManager Class.jpg")

#### 项目类 继承关系
```
@interface TestTableViewItem : RETableViewItem  //封装Item
```
```
@interface TestTableViewCell : RETableViewCell  //封装Cell
```
```
@interface BaseFormViewController : UIViewController //封装了RETableViewManger管理的表格的基类
```
```
@interface ViewController : BaseFormViewController  //继承表格基类
```
#### 使用方法

1. 注册Item和Cell

```
self.formManager[@"TestTableViewItem"] = @"TestTableViewCell";
//  [self registerItemClass:TestTableViewItem.class forCellClass:TestTableViewCell.class];
```
2. 创建SectionArray
```
NSMutableArray *sectionArray = [NSMutableArray array];
```
3. 创建Section
```
RETableViewSection *section = [RETableViewSection section];
```
4. Section添加Items
```
for (TestModel *model in self.dataArray) {
    TestTableViewItem *item = [[TestTableViewItem alloc] init];
    item.model = model;
    item.selectionHandler = ^(TestTableViewItem * it) {
        NSLog(@"点击了 %@", it.model.name);
    };
    [section addItem: item];
}
```
5. SectionArray 添加数据
```
[sectionArray addObject:section];
```
6. 刷新FormManager的数据源
```
[self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
```
7. 刷新表格
```
[self.formTable reloadData];
```
