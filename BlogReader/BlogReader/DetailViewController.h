//
//  DetailViewController.h
//  BlogReader
//
//  Created by Cookie Gu on 15/11/5.
//  Copyright © 2015年 Cookie Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

