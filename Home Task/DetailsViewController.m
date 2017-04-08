//
//  DetailsViewController.m
//  Home Task
//
//  Created by Ян on 08.04.17.
//  Copyright © 2017 Ян. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property(nonatomic,weak) IBOutlet UILabel *titleLabel;
@property(nonatomic,weak) IBOutlet UILabel *detailsLabel;

@end
@implementation DetailsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.selectedCorporation.title;
    self.detailsLabel.text = self.selectedCorporation.title;
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
}


- (IBAction)doneTapped:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
