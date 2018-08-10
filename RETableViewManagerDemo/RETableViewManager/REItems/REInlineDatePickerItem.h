//
//  REInlineDatePickerItem.h
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 10/4/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RETableViewItem.h"

@class REDateTimeItem;

@interface REInlineDatePickerItem : RETableViewItem

@property (weak, nonatomic) REDateTimeItem *dateTimeItem;

+ (instancetype)itemWithDateTimeItem:(REDateTimeItem *)dateTimeItem;
- (instancetype)initWithDateTimeItem:(REDateTimeItem *)dateTimeItem;

@end
