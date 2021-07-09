//
//  UITableView+Category.m
//  fenleiCate
//
//  Created by huhuhu on 2021/7/7.
//

#import "UITableView+Category.h"
#import <Foundation/Foundation.h>
@implementation UITableView (Category)

+ (instancetype)creatTableViewWithFrame:(CGRect)frame
                                  style:(UITableViewStyle)style
                        backgroundColor:(UIColor *)backgroundColor
                               delegate:(id)delegate
                           isNullFooter:(BOOL)isFooter{
    
    
    
    UITableView *tableView          = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.separatorStyle        = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor       = backgroundColor;
    tableView.delegate              = delegate;
    tableView.dataSource            = delegate;
    //隐藏指示器
    tableView.showsVerticalScrollIndicator = NO;
    return tableView;
}

@end
