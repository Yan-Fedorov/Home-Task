//
//  ViewController.m
//  Home Task
//
//  Created by Ян on 02.04.17.
//  Copyright © 2017 Ян. All rights reserved.
//

#import "ViewController.h"
#import "Corporations.h"
#import "DetailsViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *corporation;


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
        [self readData];
}

-(void) readData
{
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"Corporation" withExtension:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfURL:fileURL];
    
    self.corporation = [[NSMutableArray alloc]init];
    
    for(NSDictionary *dict in data) {
        Corporations *corporation = [[Corporations alloc] initWithDictionary:dict];
        [self.corporation addObject:corporation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.corporation.count;
}
-(UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)
indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"
                                                             forIndexPath:indexPath];
    Corporations *corporation = self.corporation[indexPath.row];
    cell.textLabel.text = corporation.title;
    
   

    return cell;
}

@end
