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
#import "AFJSONRequestOperation.h"
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/CALayer.h>

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

    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"xv"]];
    self.tableView.backgroundColor = background;
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
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://selebrations.pavanratnakar.com/controller/rangoliController.php?type=rangolis"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        rangolis = [JSON valueForKeyPath:@"response"];
        
        // TODO : STUPID LOGIC. NEED TO REVISE
        NSInteger i = 0;
        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
        for (id rangoli in rangolis) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
            i++;
        }

        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationBottom];
        [self.tableView endUpdates];

    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        NSLog(@"Selebrations Rangolis: %@,%@,%@", response,error,JSON);
    }];
    [operation start];
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
    if (cell == nil) {
        cell = [[categoriesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSMutableDictionary *rangoliDetails = [rangolis objectAtIndex:indexPath.row];\
    
    // ADD CELL PROPERTIES
    [cell stopLoaderAnimation];
    cell.label.text =[NSString stringWithFormat:@"%@",[rangoliDetails objectForKey:@"title"]];
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    cell.imageView.layer.borderWidth = 1;
    cell.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.imageView.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@-80x80.jpg",[rangoliDetails objectForKey:@"guid"]]]]];

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
    if ([[segue identifier] isEqualToString:@"rangoli"]) {
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        rangoliViewController *rangoli = [segue destinationViewController];
        if (rangoli.view) {
            NSMutableDictionary *rangoliDetails = [rangolis objectAtIndex:selectedIndex];
            rangoli.id = [rangoliDetails objectForKey:@"post_name"];
            rangoli.label.text =[NSString stringWithFormat:@"%@",[rangoliDetails objectForKey:@"title"]];
            rangoli.imageView.layer.masksToBounds = YES;
            rangoli.imageView.layer.borderColor = [UIColor orangeColor].CGColor;
            rangoli.imageView.layer.borderWidth = 1;
            rangoli.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
            rangoli.imageView.image =  [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@.jpg",[rangoliDetails objectForKey:@"guid"]]]]];
            rangoli.stockDetails.text = [NSString stringWithFormat:@"In Stock"];
            rangoli.description.text = [rangoliDetails objectForKey:@"post_excerpt"];
            rangoli.price.text = [NSString stringWithFormat:@"Rs %@",[rangoliDetails objectForKey:@"price"]];
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
