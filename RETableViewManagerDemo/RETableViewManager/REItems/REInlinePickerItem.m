//
//  REInlinePickerItem.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 10/5/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "REInlinePickerItem.h"

@implementation REInlinePickerItem

+ (instancetype)itemWithPickerItem:(REPickerItem *)pickerItem {
    
    return [[REInlinePickerItem alloc] initWithPickerItem:pickerItem];
}

- (instancetype)initWithPickerItem:(REPickerItem *)pickerItem {
    
    self = [super init];
    if (self) {
        _pickerItem = pickerItem;
    }
    return self;
}

@end
