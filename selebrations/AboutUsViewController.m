//
//  AboutUsViewController.m
//  Selebrations
//
//  Created by Pavan Ratnakar on 12/2/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "SelebrationsLib.h"
#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

@synthesize tableView=_tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    owners = [[NSMutableArray alloc] init];
    NSDictionary *owner;

    owner = [NSDictionary dictionaryWithObjectsAndKeys:
            @"Sonal Ratnakar", @"name",
            @"Founder", @"role",
            @"sonalb@gmail.com", @"email",
            @"+91 9742266749", @"mobile",
            nil];
    [owners addObject:owner];
    
    owner = [NSDictionary dictionaryWithObjectsAndKeys:
             @"Gayathri Ratnakar", @"name",
             @"Founder", @"role",
             @"gaya3.ratnakar@gmail.com", @"email",
             @"+91 9742266749", @"mobile",
             nil];
    [owners addObject:owner];
    
    owner = [NSDictionary dictionaryWithObjectsAndKeys:
             @"Pavan Ratnakar", @"name",
             @"Founder / Technical Specialist", @"role",
             @"pavanratnakar@yahoo.com", @"email",
             @"+91 9742272426", @"mobile",
             nil];
    [owners addObject:owner];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wild_oliva"]];
    self.view.backgroundColor = background;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [owners count] + (expandedRowIndex != -1 ? 1 : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    NSMutableDictionary *owner = [owners objectAtIndex:[self dataIndexForRowIndex:row]];
    
    BOOL expandedCell = expandedRowIndex != -1 && expandedRowIndex + 1 == row;
    
    if (!expandedCell) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"data"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"data"];
        }
        cell.textLabel.text = [owner objectForKey:@"name"];
        [cell setTextAlignment:NSTextAlignmentCenter];
        [cell.contentView setBackgroundColor:[SelebrationsLib getRandomColor]];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expanded"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"expanded"];
        }
        [cell.contentView setBackgroundColor:[SelebrationsLib getRandomColor]];
        cell.textLabel.text = [owner objectForKey:@"role"];
        [cell.detailTextLabel setNumberOfLines:2];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Email : '%@' \nPhone : %@", [owner objectForKey:@"email"],  [owner objectForKey:@"mobile"]];
        return cell;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    BOOL preventReopen = NO;
    
    if (row == expandedRowIndex + 1 && expandedRowIndex != -1)
        return nil;
    
    [tableView beginUpdates];
    
    if (expandedRowIndex != -1) {
        NSInteger rowToRemove = expandedRowIndex + 1;
        
        preventReopen = row == expandedRowIndex;
        if (row > expandedRowIndex)
            row--;
        expandedRowIndex = -1;
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowToRemove inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    }
    NSInteger rowToAdd = -1;
    if (!preventReopen) {
        rowToAdd = row + 1;
        expandedRowIndex = row;
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowToAdd inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
        
    }
    [tableView endUpdates];
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if (expandedRowIndex != -1 && row == expandedRowIndex + 1) {
        return 100;
    }
    return 40;
}

- (NSInteger)dataIndexForRowIndex:(NSInteger)row
{
    if (expandedRowIndex != -1 && expandedRowIndex <= row) {
        if (expandedRowIndex == row)
            return row;
        else {
            return row - 1;
        }
    } else {
        return row;
    }
}

@end
