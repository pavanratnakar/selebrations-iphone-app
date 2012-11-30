//
//  categoriesViewController.m
//  selebrations
//
//  Created by Pavan Ratnakar on 11/30/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "categoriesViewController.h"
#import "categoriesTableViewCell.h"
#import "rangoliViewController.h"

@interface categoriesViewController ()

@end

@implementation categoriesViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getRangolis];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getRangolis {
    rangolis = [NSMutableArray arrayWithObjects:
                @"Pearl",
                @"Chakra",
                @"Medium Diya Plates",
                @"Square",
                nil];
    images = [NSMutableArray arrayWithObjects:
              @"http://selebrations.pavanratnakar.com/wp-content/uploads/2012/04/pearl_rangoli",
              @"http://selebrations.pavanratnakar.com/wp-content/uploads/2012/04/chakra_rangoli",
              @"http://selebrations.pavanratnakar.com/wp-content/uploads/2012/04/medium_diya_plate_red",
              @"http://selebrations.pavanratnakar.com/wp-content/uploads/2012/04/square_rangoli",
              nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return rangolis.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    categoriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.label.text = [rangolis objectAtIndex:indexPath.row];

    cell.imageView.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@-90x67.jpg",[images objectAtIndex:indexPath.row]]]]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    http://selebrations.pavanratnakar.com/wp-content/uploads/2012/02/big_diya_design_2_1_rangoli-150x112.jpg
    
    if ([[segue identifier] isEqualToString:@"rangoli"]) {
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        rangoliViewController *rangoli = [segue destinationViewController];
        if (rangoli.view) {
            rangoli.label.text = [NSString stringWithFormat:@"%@ Rangoli",[rangolis objectAtIndex:selectedIndex]];
            rangoli.image.image =  [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@-150x112.jpg",[images objectAtIndex:selectedIndex]]]]];
        }
        
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
