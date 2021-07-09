
#import <UIKit/UIKit.h>

@interface UIViewController (Category)

/**
 *登陆后淡入淡出更换rootViewController
 */
- (void)restoreRootViewController:(UIViewController *)rootViewController;

/**
 *  跳转到那个sb控制器
 *  @param sbname     SB的名字
 *  @param identifier 视图的名字
 *  @return id
 */
- (id)storyboardWithName:(NSString *)sbname Identifier:(NSString *)identifier;

#pragma mark ========= navagation创建按钮 =========

/**
 *  创建右上角按钮
 *  @param sender 按钮
 */
- (void)addRightButton:(UIButton *)sender;

/**
 *  创建右上角按钮
 *  @param name 按钮文字
 *  @param font 字体大小
 *  @param color 颜色
 */
- (void)addRightBarButton:(NSString *)name font:(UIFont *)font textColor:(UIColor *)color;

/**
 *  创建右上角按钮
 *  @param image 按钮图片
 */
- (void)addRightBarButtonImage:(UIImage *)image;

/**
 *  重写右上角按钮点击事件
 */
- (void)clickRightBarButton:(UIButton *)sender;

/**
 *  创建左上角按钮
 *  @param name 按钮文字
 */
- (void)addLeftBarButton:(NSString *)name;

/**
 *  创建左上角按钮
 *  @param image 按钮图片
 */
- (void)addLeftBarButtonImage:(UIImage *)image;

//array的解析方法
- (NSMutableArray *)WithArray:(NSArray *)array;

#pragma mark ====== 添加一个抖动动画 ======
- (void)shakeAnimationForView:(UIView *)view;

/**
 *  app缓存大小
 */
-(CGFloat)folderSize;

/**
 *  清除app缓存
 */
-(void)removeCache;

/**
 *  清除webView的缓存
 */
-(void)clearWebUrl;


@end


#pragma mark  ====== push方法 ======
@interface UIViewController (PushExtra)


- (void)navigationPushViewController:(Class)vcClass;
- (void)navigationPushViewController:(Class)vcClass animation:(BOOL)animation;
- (void)navigationPushViewController:(Class)vcClass withOperation:(void (^)(id vcInstance))operation;
- (void)navigationPushViewController:(Class)vcClass animation:(BOOL)animation withOperation:(void (^)(id vcInstance))operation;

/**
 *从vc导航到vcClass
 * @param vc 所在的UIViewController
 * @param vcClass 将要跳转的UIViewController
 * @see navigationViewController:pushViewController:withOperation:
 * @warning vc的navigationViewController应该非空并且vcClass应该是一种UIViewController
 **/
+ (void)navigationViewController:(UIViewController *)vc pushViewController:(Class)vcClass;

/**
 *从vc导航到vcClass
 * @param vc 所在的UIViewController
 * @param vcClass 将要跳转的UIViewController Class
 * @param animation 动画
 * @param operation 添加额外的操作,push之前
 * @see navigationViewController:pushViewController:
 * @warning vc的navigationViewController应该非空并且vcClass应该是一种UIViewController,operation可以为空
 **/
+ (void)navigationViewController:(UIViewController *)vc pushViewController:(Class)vcClass animation:(BOOL)animation withOperation:(void (^)(id vcInstance))operation;

@end

#pragma mark  ====== pop方法 ======
@interface UIViewController (PopExtral)

/**
 *从vc返回上一层界面
 **/
- (instancetype)popSelf;

/**
 *从vc返回到第一个界面
 **/
- (NSArray *)popToRootViewController;

/**
 *从vc返回到前面指点的某一个界面
 * @param index   vc的下标
 **/
- (instancetype)poptoViewControllerWithIndex:(NSUInteger)index;
- (instancetype)popSelfWithAnimation:(BOOL)animation;

- (NSArray *)popSelfToRootViewControllerWithAnimation:(BOOL)animation;

/**
 *从vc返回到前面指点的某一个界面
 * @param index   vc的下标
 **/
- (instancetype)poptoViewControllerWithIndex:(NSUInteger)index animation:(BOOL)animation;

/**
 *从vc返回到前面指点的某一个界面
 * @param vcname   vc的名称
 **/
- (void)popTo:(NSString *)vcname;
@end


#pragma mark  ====== present方法 ======
@interface UIViewController (PresentExtral)
- (void)presentViewController:(Class)vcClass;
- (void)presentViewController:(Class)vcClass withOperation:(void (^)(id presentedVC))operation;
- (void)presentViewController:(Class)vcClass animation:(BOOL)animation;
- (void)presentViewController:(Class)vcClass animation:(BOOL)animation withOperation:(void(^)(id presentedVC))operation;
@end

#pragma mark  ====== appDelegate方法 ======
@interface UIViewController (AppExtral)

+ (id<UIApplicationDelegate> )appDelegate;
+ (instancetype)appRootViewController;

///navigation
+ (UINavigationController *)appNavigationController;
+ (instancetype)appNavigationRootViewController;
+ (instancetype)appNavigationTopViewController;
+ (instancetype)appNavigationVisibleViewController;

///tabBarController
+ (UITabBarController *)appTabBarController;
+ (instancetype)appTabBarSelelctedViewController;
+ (instancetype)appTabBarTopViewController;
+ (instancetype)appTabBarVisibleViewController;
@end


@interface UIViewController (NavigationBarExtral)
#pragma mark - 导航栏
///安装导航栏
+(void)sch_setupNavigationBarWithNavigationBarBgColor:(UIColor *)bgColor andTitleColor:(UIColor *)titleColor andTitleFont:(UIFont *)titleFont;


/**
 *隐藏导航栏底部线
 **/
- (void)sch_hideBottomHairline;

/**
 *显示导航栏底部线
 **/
- (void)sch_showBottomHairline;

/**
 *去掉返回键上的字及其设置颜色
 * @param color   颜色
 **/
+(void)sch_clearBackTitleWithColor:(UIColor*)color;

#pragma mark - FIX
///修复列表在隐藏了NavigationBar之后空出了20的高度的问题，请在viewWillAppear使用
- (void)fixTwentyIntervalForTableViewWithNavigationBar;
///使用了fixTwentyIntervalForTableViewWithNavigationBar之后，记得在viewWillDisappear使用此方法还原
- (void)restoreTwentyIntervalForTableViewWithNavigationBar;

/**
 *NavigationBar的颜色
 * @param color   颜色
 * 如果有透明的颜色
 * 在viewWillAppear
 * self.navigationController.navigationBar.translucent = NO;
 * 在viewWillDisappear
 * self.navigationController.navigationBar.translucent = YES;
 **/
-(void)setNavigationBarStyleColor:(UIColor *)color;

/**
 *设置状态栏的背景颜色
 * @param color   颜色
 **/
-(void)setStatusBarBackgroundColor:(UIColor *)color;

/**
 * 隐藏 NavigationBar
 * @param hiden   是否隐藏
 **/
-(void)setNavigationBarStyleLighthidden:(BOOL)hiden animated:(BOOL)animated;

/**
 * 清除tabbar分割线
 * @param color   颜色
 **/
-(void)clearTabbarBlockLine:(UIColor *)color;

#pragma mark ===打印返回来的model===
/**
 * 打印返回来的数据 快速便利转成model形式
 * @param dic   数据
 **/
- (void)nslogPropertyWithDic:(NSDictionary *)dic;

@end
