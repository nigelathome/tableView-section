//
//  ViewController.m
//  Sections
//
//  Created by Nigel Lee on 9/1/16.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "ViewController.h"

static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";

@interface ViewController ()

@property (copy, nonatomic) NSDictionary *names;
@property (copy, nonatomic) NSArray *keys;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = (id)[self.view viewWithTag:1];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SectionsTableIdentifier];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    self.names = [NSDictionary dictionaryWithContentsOfFile:path];
    self.keys = [[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    if (tableView.style == UITableViewStylePlain) {
        // set scrollView
        UIEdgeInsets contentInset = tableView.contentInset;
        contentInset.top = 20;
        [tableView setContentInset:contentInset];
       
        // Reducing Status Bar Interference, add rectange into status bar
        UIView *background= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        //background.backgroundColor = [UIColor redColor];
        background.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
        [self.view addSubview:background];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.keys count];
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = self.keys[section];
    NSArray *nameSection = self.names[key];
    return [nameSection count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.keys[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier forIndexPath:indexPath];
    NSString *key = self.keys[indexPath.section];
    NSArray *nameSection = self.names[key];
    cell.textLabel.text = nameSection[indexPath.row];
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (1 == tableView.tag) {
        tableView.sectionIndexBackgroundColor = [UIColor clearColor];//背景色
        tableView.sectionIndexColor = [UIColor blueColor];//字体色
        return self.keys;
    } else {
        return nil;
    }
}

@end
