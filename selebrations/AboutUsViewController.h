//
//  AboutUsViewController.h
//  Selebrations
//
//  Created by Pavan Ratnakar on 12/2/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutUsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *owners;
    NSInteger expandedRowIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end