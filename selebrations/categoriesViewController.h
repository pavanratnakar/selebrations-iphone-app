//
//  categoriesViewController.h
//  selebrations
//
//  Created by Pavan Ratnakar on 11/30/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface categoriesViewController : UITableViewController <NSXMLParserDelegate> {
    NSMutableArray *rangolis;
    NSMutableArray *images;
    // loadSwirlie will display a loading overlay while the data is downloaded from the RSS feed.
    UIActivityIndicatorView *loadSwirlie;
}

@end
