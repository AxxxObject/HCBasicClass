

#import "UIViewController+Category.h"
#import <objc/runtime.h>

@implementation UIViewController (Category)
#pragma mark ========= 设置rootview 淡入淡出效果 ======
- (void)restoreRootViewController:(UIViewController *)rootViewController
{
    typedef void (^Animation)(void);
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}
#pragma mark ========= 加载 storyboard ======
- (id)storyboardWithName:(NSString *)sbname Identifier:(NSString *)identifier
{
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbname bundle:[NSBundle mainBundle]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbname bundle:nil];
    return  [storyboard instantiateViewControllerWithIdentifier:identifier];
}

#pragma mark ========= navagation创建按钮 =========
- (void)addRightButton:(UIButton *)sender{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:sender];
    self.navigationItem.rightBarButtonItem=rightButton;
}
- (void)addRightBarButton:(NSString *)name font:(UIFont *)font textColor:(UIColor *)color{

    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0 , 35, 35)];
    [rightBtn setTitle:name forState:(UIControlStateNormal)];
    rightBtn.titleLabel.font = font;
    [rightBtn setTitleColor:color forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(clickRightBarButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightButton;
}
- (void) addRightBarButtonImage:(UIImage *)image{
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0 , 35, 35)];
    [rightBtn setImage:image forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickRightBarButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
//    rightButton.tintColor=[UIColor blackColor];
    self.navigationItem.rightBarButtonItem=rightButton;
}
/*
 *  点击事件
 */
- (void)clickRightBarButton:(UIButton *)sender{
    NSLog(@"请在对应的控制器里重写此方法,clickRightBarButton");
}

- (void)addLeftBarButton:(NSString *)name{
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:name style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBarButton:)];
    self.navigationItem.leftBarButtonItem=leftBarButton;
}

- (void)addLeftBarButtonImage:(UIImage *)image{
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBarButton:)];
    leftBarButton.tintColor=[UIColor blackColor];
    self.navigationItem.leftBarButtonItem=leftBarButton;
}

- (void)clickLeftBarButton:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//array的解析方法
- (NSMutableArray *)WithArray:(NSArray *)array{
    
    NSMutableArray * LevelArray=[[NSMutableArray alloc] init];
    NSMutableArray * NewLevelArray=[[NSMutableArray alloc] init];
    NSMutableArray * OneArray=[[NSMutableArray alloc] init];
    
    for (int i=0; i<array.count; i++) {
        [LevelArray addObject:[array[i] objectForKey:@"HOSP_LEVEL"]];
    }
    for (NSString *str in LevelArray) {
        if (![NewLevelArray containsObject:str]) {
            [NewLevelArray addObject:str];
        }
    }
    for(int i=0 ; i<NewLevelArray.count ; i++){
        NSString * str=NewLevelArray[i];
        NSMutableDictionary * NewDic=[[NSMutableDictionary alloc] init];
        [NewDic setObject:str forKey:@"Level"];
        NSMutableArray * NewArray=[[NSMutableArray alloc] init];
        for (int j=0; j<array.count; j++) {
            NSDictionary * dict=array[j];
            if ([str isEqualToString:dict[@"HOSP_LEVEL"]]) {
                [NewArray addObject:array[j]];
            }
            [NewDic setObject:NewArray forKey:@"array"];
        }
        [OneArray addObject:NewDic];
    }
    
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"Level" ascending:YES]];
    [OneArray sortUsingDescriptors:sortDescriptors];
    
    return OneArray;
}


// 缓存大小
- (CGFloat)folderSize{
    CGFloat folderSize = 0.0;
    
    //获取路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    
    //获取所有文件的数组
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    
    NSLog(@"文件数：%ld",(unsigned long)files.count);
    
    for(NSString *path in files) {
        
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        
        //累加
        
        folderSize += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    //转换为M为单位
    CGFloat sizeM = folderSize /1000.0/1000.0;
    
    return sizeM;
}
- (void)removeCache{

    //===============清除缓存==============
    //获取路径
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    
    //返回路径中的文件数组
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    
    NSLog(@"文件数：%ld",(unsigned long)[files count]);
    for(NSString *p in files){
        NSError*error;
        
        NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                NSLog(@"清除成功");
                
                //这里发送一个通知给外界，外界接收通知，可以做一些操作（比如UIAlertViewController）
                
            }else{
                
                NSLog(@"清除失败");
                
            }
        }
    }
}


// 抖动动画
- (void)shakeAnimationForView:(UIView *)view{
    
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    
    [viewLayer addAnimation:animation forKey:nil];
}

-(void)clearWebUrl{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    
    //清除UIWebView的缓存
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];
}

@end

#pragma mark  ====== push方法 ======
@implementation UIViewController (PushExtra)

- (void)navigationPushViewController:(Class)vcClass{
    [UIViewController navigationViewController:self pushViewController:vcClass];
}

- (void)navigationPushViewController:(Class)vcClass animation:(BOOL)animation{
    [UIViewController navigationViewController:self pushViewController:vcClass animation:animation withOperation:nil];
}

- (void)navigationPushViewController:(Class)vcClass withOperation:(void (^)(id vcInstance))operation{
    [UIViewController navigationViewController:self pushViewController:vcClass animation:YES withOperation:operation];
}

- (void)navigationPushViewController:(Class)vcClass animation:(BOOL)animation withOperation:(void (^)(id vcInstance))operation{
    [UIViewController navigationViewController:self pushViewController:vcClass animation:animation withOperation:operation];
}

+ (void)navigationViewController:(UIViewController *)vc pushViewController:(Class)vcClass{
    [UIViewController navigationViewController:vc pushViewController:vcClass animation:YES withOperation:nil];
}

+ (void)navigationViewController:(UIViewController *)vc pushViewController:(Class)vcClass animation:(BOOL)animation withOperation:(void (^)(id vcInstance))operation{
    if([vcClass isSubclassOfClass:[UIViewController class]]){
        if(vc.navigationController){
            __block id pushViewController = [[vcClass alloc] init];
            [pushViewController setHidesBottomBarWhenPushed:YES];
            if(operation){
                operation(pushViewController);
            }
            [vc.navigationController pushViewController:pushViewController animated:animation];
        }else{
            NSLog(@"%@ navigation controller is nil",vc.navigationController);
        }
    }else{
        NSLog(@"%@ object is not a kind of UIViewController",vc);
    }
}

@end

#pragma mark  ====== pop方法 ======
@implementation UIViewController (PopExtral)

- (instancetype)popSelf{
    return [self popSelfWithAnimation:YES];
}

- (NSArray *)popToRootViewController{
    return [self popSelfToRootViewControllerWithAnimation:YES];
}

- (instancetype)poptoViewControllerWithIndex:(NSUInteger)index{
    return [self poptoViewControllerWithIndex:index animation:YES];
}

- (instancetype)popSelfWithAnimation:(BOOL)animation{
    return [self.navigationController popViewControllerAnimated:animation];
}

- (NSArray *)popSelfToRootViewControllerWithAnimation:(BOOL)animation{
    return [self.navigationController popToRootViewControllerAnimated:animation];
}

- (instancetype)poptoViewControllerWithIndex:(NSUInteger)index animation:(BOOL)animation{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if(index < viewControllers.count){
        UIViewController *popVC = viewControllers[index];
        [self.navigationController popToViewController:popVC animated:animation];
        return popVC;
    }
    return nil;
}

//LR 新增方法
- (void)popTo:(NSString *)vcname
{
    NSArray *pops = self.navigationController.viewControllers;
    for (UIViewController *c in pops) {
        if ([[[c class] description] isEqualToString:vcname]) {
            [self.navigationController popToViewController:c animated:YES];
            break;
        }
    }
}

@end


#pragma mark  ====== present方法 ======
@implementation UIViewController (PresentExtral)
- (void)presentViewController:(Class)vcClass{
    [self presentViewController:vcClass animation:YES];
}

- (void)presentViewController:(Class)vcClass withOperation:(void (^)(id presentedVC))operation{
    [self presentViewController:vcClass animation:YES withOperation:operation];
}

- (void)presentViewController:(Class)vcClass animation:(BOOL)animation{
    [self presentViewController:vcClass animation:animation withOperation:nil];
}

- (void)presentViewController:(Class)vcClass animation:(BOOL)animation withOperation:(void(^)(id presentedVC))operation{
    if([vcClass isSubclassOfClass:[UIViewController class]]){
        __block id presentedVC = [[vcClass alloc] init];
        if(operation){
            operation(presentedVC);
        }
        [self presentViewController:presentedVC animated:animation completion:nil];
    }else{
        NSLog(@"%@ class is not a subclass of UIViewController",NSStringFromClass(vcClass));
    }
}

@end

@implementation UIViewController (AppExtral)

+ (id<UIApplicationDelegate> )appDelegate{
    return [[UIApplication sharedApplication] delegate];
}

+ (instancetype)appRootViewController{
    return [[[self appDelegate] window] rootViewController];
}

+ (UINavigationController *)appNavigationController{
    UINavigationController *navVc = (UINavigationController *)[self appRootViewController];
    if([navVc isKindOfClass:[UINavigationController class]]){
        return navVc;
    }else if([navVc isKindOfClass:[UITabBarController class]]){
        id nav = [(UITabBarController *)navVc selectedViewController];
        if([nav isKindOfClass:[UINavigationController class]]){
            return nav;
        }
    }
    return nil;
}

+ (instancetype)appNavigationRootViewController{
    UINavigationController *navVc = [self appNavigationController];
    if(navVc){
        NSArray *viewControllers = [navVc viewControllers];
        return viewControllers.count?viewControllers[0]:nil;
    }
    return nil;
}

+ (instancetype)appNavigationTopViewController{
    UINavigationController *navVc = [self appNavigationController];
    if(navVc){
        return [navVc topViewController];
    }
    return nil;
}

+ (instancetype)appNavigationVisibleViewController{
    UINavigationController *navVc = [self appNavigationController];
    if(navVc){
        return [navVc visibleViewController];
    }
    return nil;
}

+ (UITabBarController *)appTabBarController{
    UITabBarController *tabVC = (UITabBarController *)[self appRootViewController];
    if([tabVC isKindOfClass:[UITabBarController class]]){
        return tabVC;
    }
    return nil;
}

+ (instancetype)appTabBarSelelctedViewController{
    UITabBarController *tabVc = [self appTabBarController];
    if(tabVc){
        return [tabVc selectedViewController];
    }
    return nil;
}

+ (instancetype)appTabBarTopViewController{
    UIViewController *vc = [self appTabBarSelelctedViewController];
    if([vc isKindOfClass:[UINavigationController class]]){
        return [(UINavigationController *)vc topViewController];
    }
    return vc;
}

+ (instancetype)appTabBarVisibleViewController{
    UIViewController *vc = [self appTabBarSelelctedViewController];
    if([vc isKindOfClass:[UINavigationController class]]){
        return [(UINavigationController *)vc visibleViewController];
    }
    return vc;
}

@end

#pragma mark - 导航栏
@implementation UIViewController (NavigationBarExtral)

#pragma mark ---安装导航栏
+ (void)sch_setupNavigationBarWithNavigationBarBgColor:(UIColor *)bgColor andTitleColor:(UIColor *)titleColor andTitleFont:(UIFont *)titleFont
{
    UINavigationBar *naviBar = [UINavigationBar appearance];
    //导航条背景色
    if (bgColor) {
        //        [naviBar setBackgroundImage:[UIImage lr_imageWithColor:bgColor] forBarMetrics:UIBarMetricsDefault];
        [naviBar setBarTintColor:bgColor];
    }
    
    //导航条标题
    if (titleColor && titleFont) {
        [naviBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor,
                                          NSFontAttributeName:titleFont}];
    }else if(titleColor) {
        [naviBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
    }
}

#pragma mark ---隐藏navigationBar底部线
- (void)sch_hideBottomHairline
{
    UIImageView *navBarHairlineImageView = [self sch_findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
}

#pragma mark ---显示navigationBar底部线
- (void)sch_showBottomHairline
{
    UIImageView *navBarHairlineImageView = [self sch_findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = NO;
}

#pragma mark ---找到navigationBar底部线
- (UIImageView *)sch_findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self sch_findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark --- 去掉返回键上的字及其设置颜色
+(void)sch_clearBackTitleWithColor:(UIColor*)color{
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].tintColor = color;
}

#pragma mark ---修复列表在隐藏了NavigationBar之后空出了20的高度的问题，请在viewWillAppear使用
- (void)fixTwentyIntervalForTableViewWithNavigationBar
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

#pragma mark ---使用了fixTwentyIntervalForTableViewWithNavigationBar之后，记得在viewWillDisappear使用此方法还原
- (void)restoreTwentyIntervalForTableViewWithNavigationBar
{
    self.edgesForExtendedLayout = UIRectEdgeAll;
}

-(void)setNavigationBarStyleLighthidden:(BOOL)hiden animated:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:hiden animated:animated];
//    self.navigationController.navigationBar.alpha = 1;
//
//    self.navigationController.navigationBar.barTintColor = COLOR_MAIN;
//    self.navigationController.navigationBar.tintColor = COLOR_WHITE;
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:COLOR_WHITE}];
}

-(void)setNavigationBarStyleColor:(UIColor *)color{
    
    self.navigationController.navigationBar.barTintColor = color;
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar;
    if (@available(iOS 13,*)) {
        if (!statusBar) {
            //获取keyWindow
            UIWindow *keyWindow = [self getKeyWindow];
            
            if (color == [UIColor whiteColor] || color == [UIColor clearColor]) {
                UIView *view =  [keyWindow.subviews objectAtIndex:1];
                [view removeFromSuperview];
            }else{
                statusBar = [[UIView alloc] initWithFrame:keyWindow.windowScene.statusBarManager.statusBarFrame];
                [keyWindow addSubview:statusBar];
            }
        }
    }else{
        statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    }
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (UIWindow *)getKeyWindow
{
    // 获取keywindow
    NSArray *array = [UIApplication sharedApplication].windows;
    UIWindow *window = [array objectAtIndex:0];
    if (!window.hidden || window.isKeyWindow) { //  判断取到的window是不是keywidow
        return window;
    }
    //  如果上面的方式取到的window 不是keywidow时  通过遍历windows取keywindow
    for (UIWindow *window in array) {
        if (!window.hidden || window.isKeyWindow) {
            return window;
        }
    }
    return nil;
}

-(void)clearTabbarBlockLine:(UIColor *)color{
    //删除tabbar边框线
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:color]];
}

- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)nslogPropertyWithDic:(NSDictionary *)dic {
    
    
    
    if (![dic isKindOfClass:[NSDictionary class]]) {
        NSLog(@"无法解析为model，因为传入参数不是一个字典");
        return;
    }
    
    if (dic.count == 0) {
        NSLog(@"无法解析为model，因为该字典为空");
        return;
    }
    
    
    NSMutableString *strM = [NSMutableString string];
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        NSString *className = NSStringFromClass([obj class]) ;
        if ([className isEqualToString:@"__NSCFString"] | [className isEqualToString:@"__NSCFConstantString"] | [className isEqualToString:@"NSTaggedPointerString"]) {
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFArray"] |
                  [className isEqualToString:@"__NSArray0"] |
                  [className isEqualToString:@"__NSArrayI"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSArray *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFDictionary"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSDictionary *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFNumber"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSNumber *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFBoolean"]){
            [strM appendFormat:@"@property (nonatomic, assign) BOOL   %@;\n",key];
        }else if ([className isEqualToString:@"NSDecimalNumber"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }
        else if ([className isEqualToString:@"NSNull"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }else if ([className isEqualToString:@"__NSArrayM"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSArray *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }
        
    }];
    NSLog(@"\n%@\n",strM);
}

@end
