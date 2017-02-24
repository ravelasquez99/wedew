//
//  WedewTabBarController.m
//  wedew
//
//  Created by Richard Velazquez on 2/24/17.
//  Copyright © 2017 Ricky. All rights reserved.
//

#import "WedewTabBarController.h"

@interface WedewTabBarController ()

@property (nonatomic, strong) UIViewController *toDoViewController;
@property (nonatomic, strong) UIViewController *accountViewController;

@end

@implementation WedewTabBarController
+(NSString *)firstTitle { return @"To Dos";}
+(NSString *)secondTitle { return @"Account";}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setupViewControllers {
    self.toDoViewController = [UIViewController new];
    self.accountViewController = [UIViewController new];
    
    NSArray *viewControllers = @[self.toDoViewController, self.accountViewController];
    [self setViewControllers:viewControllers];
    
    [self setSelectedIndex:0];
    
    [self setTitle:@"Wedew"];
    [[self.tabBar.items objectAtIndex:0] setTitle:[WedewTabBarController firstTitle]];
    [[self.tabBar.items objectAtIndex:1] setTitle:[WedewTabBarController secondTitle]];
    
    self.toDoViewController.view.backgroundColor = [UIColor greenColor];
    self.accountViewController.view.backgroundColor = [UIColor blueColor];
    
}

@end
