//
//  WSCollectionCellHeader.h
//  VVSBox
//
//  Created by ws on 17/1/24.
//  Copyright © 2017年 ws. All rights reserved.
//

#ifndef WSCollectionCellHeader_h
#define WSCollectionCellHeader_h

/*********************************屏幕宽高***********************************/
#define VVS_SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define VVS_SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

/**************************无间距****************************/
/** 设置格子的X坐标
 * SUPERVIEW 指九宫格每个小格子的父视图
 * WIDTH     指九宫格每个小格子的宽度  int width = (VVS_SCREEN_WIDTH - (colunm - 1) * margin) / colunm;
 * COLUMN    指九宫格的纵向列数
 * 注意： MARGIN 和 WIDTH不能都是CGFloat
 */
#define CELL_X_WITH_SUPERVIEW_AND_WIDTH(SUPERVIEW,WIDTH,COLUMN) SUPERVIEW.subviews.count % COLUMN * WIDTH

/** 设置格子的Y坐标
 * SUPERVIEW 指九宫格每个小格子的父视图
 * WIDTH     指九宫格每个小格子的宽度  int width = (VVS_SCREEN_WIDTH - (colunm - 1) * margin) / colunm;
 * COLUMN    指九宫格的纵向列数
 * 注意： MARGIN 和 WIDTH不能都是CGFloat
 */
#define CELL_Y_WITH_SUPERVIEW_AND_HEIGHT(SUPERVIEW,HEIGHT,COLUMN) SUPERVIEW.subviews.count / COLUMN * HEIGHT

/**************************有间距****************************/
/** 设置格子的X坐标
 * SUPERVIEW 指九宫格每个小格子的父视图
 * WIDTH     指九宫格每个小格子的宽度  int width = (VVS_SCREEN_WIDTH - (colunm - 1) * margin) / colunm;
 * COLUMN    指九宫格的纵向列数
 * MARGIN    指格子之间的横向间距
 * 注意： MARGIN 和 WIDTH不能都是CGFloat
 */
#define CELL_X_WITH_PARAMETERS(SUPERVIEW,WIDTH,COLUMN,MARGIN) SUPERVIEW.subviews.count % COLUMN * WIDTH + SUPERVIEW.subviews.count % COLUMN  * MARGIN

/** 设置格子的Y坐标
 * SUPERVIEW 指九宫格每个小格子的父视图
 * HEIGHT    指九宫格每个小格子的高度
 * COLUMN    指九宫格的纵向列数
 * MARGIN    指格子之间的纵向间距
 * 注意： MARGIN 和 HEIGHT不能都是CGFloat
 */
#define CELL_Y_WITH_PARAMETERS(SUPERVIEW,HEIGHT,COLUMN,MARGIN) SUPERVIEW.subviews.count / COLUMN * HEIGHT + SUPERVIEW.subviews.count / COLUMN * MARGIN

/**************************有间距、有边距****************************/
/** 设置格子的X坐标
 * SUPERVIEW 指九宫格每个小格子的父视图
 * WIDTH     指九宫格每个小格子的宽度 int width = (VVS_SCREEN_WIDTH - (colunm + 1) * margin) / colunm;
 * COLUMN    指九宫格的纵向列数
 * MARGIN    指格子之间的横向间距 和 外边距
 * 注意： MARGIN 和 WIDTH不能都是CGFloat
 */
#define CELL_X_WITH_EDGE_PARAMETERS(SUPERVIEW,WIDTH,COLUMN,MARGIN) SUPERVIEW.subviews.count % COLUMN * WIDTH + (SUPERVIEW.subviews.count % COLUMN + 1) * MARGIN

/** 设置格子的Y坐标
 * SUPERVIEW 指九宫格每个小格子的父视图
 * HEIGHT    指九宫格每个小格子的高度
 * COLUMN    指九宫格的纵向列数
 * MARGIN    指格子之间的纵向间距 和 外边距
 * 注意： MARGIN 和 HEIGHT不能都是CGFloat
 */
#define CELL_Y_WITH_EDGE_PARAMETERS(SUPERVIEW,HEIGHT,COLUMN,MARGIN) SUPERVIEW.subviews.count / COLUMN * HEIGHT + (SUPERVIEW.subviews.count / COLUMN + 1) * MARGIN

#endif /* WSCollectionCellHeader_h */
