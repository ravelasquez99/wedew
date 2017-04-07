//
//  ToDoViewController.m
//  wedew
//
//  Created by Richard Velazquez on 2/24/17.
//  Copyright © 2017 Ricky. All rights reserved.
//

#import "ToDoViewController.h"
#import "StyleGuide.h"

@interface ToDoViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic) BOOL didSetupView;

@end

@implementation ToDoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    self.didSetupView = NO;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupView];
    [self.tableview reloadData];
    
}

- (void)setup {
    self.title = @"wedew";
    self.tableview = [UITableView new];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)setupView {
    if (!self.didSetupView) {
        [self.view addSubview:self.tableview];
        self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
        
        [[self.tableview.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:true];
        [[self.tableview.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:true];
        [[self.tableview.widthAnchor constraintEqualToAnchor:self.view.widthAnchor] setActive:true];
        [[self.tableview.heightAnchor constraintEqualToAnchor:self.view.heightAnchor] setActive: true];
        self.didSetupView = YES;
        [self setupNavBar];
    }
}

- (void)setupNavBar {
    self.navigationController.navigationBar.backgroundColor = StyleGuide.primaryColor;
    self.navigationController.navigationBar.barTintColor = StyleGuide.primaryColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    UIBarButtonItem *plus = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(plusButtonPressed:)];
    plus.tintColor = [UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:plus];
}

- (void)plusButtonPressed:(id)sender {
}

//MARK:- Tableview Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
//    if (cell == nil) {
//        cell = [UITableViewCell new];
//    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %li", (long)indexPath.row];
    return [UITableViewCell new];
}

@end
