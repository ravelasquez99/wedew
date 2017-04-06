//
//  WedewTabBarController.m
//  wedew
//
//  Created by Richard Velazquez on 2/24/17.
//  Copyright © 2017 Ricky. All rights reserved.
//

#import "WedewTabBarController.h"
#import "ToDoViewController.h"

@interface WedewTabBarController ()

@property (nonatomic, strong) ToDoViewController *toDoViewController;
@property (nonatomic, strong) UIViewController *accountViewController;


@end

static NSString *firstTitle = @"To Dos";
static NSString *secondTitle = @"Account";

@implementation WedewTabBarController

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
    self.toDoViewController = [ToDoViewController new];
    self.accountViewController = [UIViewController new];
    
    UINavigationController *toDoNavController = [[UINavigationController alloc] initWithRootViewController:self.toDoViewController];
    UINavigationController *accountNavController = [[UINavigationController alloc] initWithRootViewController:self.accountViewController];
    
    NSArray *viewControllers = @[toDoNavController, accountNavController];
    [self setViewControllers:viewControllers];
    
    [self setSelectedIndex:0];
    
    [[self.tabBar.items objectAtIndex:0] setTitle: firstTitle];
    [[self.tabBar.items objectAtIndex:1] setTitle: secondTitle];
    
    self.toDoViewController.view.backgroundColor = [UIColor greenColor];
    self.accountViewController.view.backgroundColor = [UIColor blueColor];
    
}

@end
