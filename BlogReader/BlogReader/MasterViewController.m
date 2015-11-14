//
//  MasterViewController.m
//  BlogReader
//
//  Created by Cookie Gu on 15/11/5.
//  Copyright © 2015年 Cookie Gu. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.titleArray = [NSArray arrayWithObjects:@"Apple", @"Pear" , @"Orange", @"bear", nil];
    self.booksArray = [NSArray arrayWithObjects: @"Hamlet", @"King Lear", @"Othello", @"Macbeth", nil];
    NSString *bookTitle = self.booksArray[2];
    [bookTitle uppercaseString];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        // get indexPath
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        // get the object
        NSString *object = self.booksArray[indexPath.row];
        // set the destinationViewController's detail item
        [[segue destinationViewController] setDetailItem :object];
    }
}

#pragma mark - Table View

// since we only have one section, we can get rid of the following method.
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.titleArray[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

@end
