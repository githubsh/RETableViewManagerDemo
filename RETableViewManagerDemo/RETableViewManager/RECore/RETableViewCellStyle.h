//
// RETableViewCellStyle.h
// RETableViewManager
//
// Copyright (c) 2013 Roman Efimov (https://github.com/romaonthego)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import "RETableViewCell.h"

@interface RETableViewCellStyle : NSObject <NSCopying>

@property (assign, nonatomic) CGFloat cellHeight;                                               //cell高度
@property (assign, nonatomic) UITableViewCellSelectionStyle defaultCellSelectionStyle;          //默认cell选择样式

@property (assign, nonatomic) CGFloat backgroundImageMargin;                                    //背景图片外边距
@property (assign, nonatomic) CGFloat contentViewMargin;                                        //内容区外边距

@property (strong, nonatomic) NSMutableDictionary *backgroundImages;                            //背景图片Dict
@property (strong, nonatomic) NSMutableDictionary *selectedBackgroundImages;                    //选中背景图片Dict

- (BOOL)hasCustomBackgroundImage;                                                               //是否自定义背景图片
- (UIImage *)backgroundImageForCellType:(RETableViewCellType)cellType;                          //获取某个cell类型的背景图片
- (void)setBackgroundImage:(UIImage *)image forCellType:(RETableViewCellType)cellType;          //设置某个cell类型的背景图片

- (BOOL)hasCustomSelectedBackgroundImage;                                                       //是否自定义选中背景图片
- (UIImage *)selectedBackgroundImageForCellType:(RETableViewCellType)cellType;                  //获取某个cell类型的选中背景图片
- (void)setSelectedBackgroundImage:(UIImage *)image forCellType:(RETableViewCellType)cellType;  //设置某个cell类型的选中背景图片

@end
