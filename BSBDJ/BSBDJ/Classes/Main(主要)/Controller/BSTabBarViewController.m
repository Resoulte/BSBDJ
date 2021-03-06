//
//  BSTabBarViewController.m
//  BSBDJ
//
//  Created by ma c on 16/8/27.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "BSTabBarViewController.h"
#import "BSEssenceViewController.h"
#import "BSFriendTrendsViewController.h"
#import "BSMeViewController.h"
#import "BSNewViewController.h"
#import "BSPublishViewController.h"
#import "BSTabBar.h"
#import "BSNavViewController.h"

@interface BSTabBarViewController ()

@end

@implementation BSTabBarViewController

+ (void)initialize {

    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor darkGrayColor]} forState:UIControlStateSelected];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 精华
    [self viewController:[[BSEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    // 最新
    [self viewController:[[BSNewViewController alloc] init] title:@"最新" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    // 关注
    [self viewController:[[BSFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    // 我
    [self viewController:[[BSMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    
    // tabBar是只读的，不能直接拿到换成自定义的，就要使用kvc
//    self.tabBar = [[BSTabBar alloc] init];
    
    [self setValue:[[BSTabBar alloc] init] forKey:@"tabBar"];
    
}

/**设置各个界面控制器*/
- (void)viewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    viewController.tabBarItem.title =title;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    UINavigationController *nav = [[BSNavViewController alloc] initWithRootViewController:viewController];
    
    viewController.title = title;
    
    [self addChildViewController:nav];
    
}

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    
//    for (UIView *button in self.tabBar.subviews) {
//        button.frame = CGRectMake(0, 0, 70, 20);
//    }
//
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
