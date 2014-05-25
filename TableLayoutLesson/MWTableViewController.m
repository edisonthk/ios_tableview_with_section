//
//  MWTableViewController.m
//  TableLayoutLesson
//
//  Created by Edisonthk on 5/20/14.
//  Copyright (c) 2014 Maizework. All rights reserved.
//

#import "MWTableViewController.h"

@interface MWTableViewController ()

@property NSMutableDictionary* items;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation MWTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadInitialData];
    
}


- (void) loadInitialData
{
//    self.items = @{@"B" : @[@"Bear", @"Black Swan", @"Buffalo"],
//                   @"C" : @[@"Camel", @"Cockatoo"],
//                   @"D" : @[@"Dog", @"Donkey"],
//                   @"E" : @[@"Emu"],
//                   @"G" : @[@"Giraffe", @"Greater Rhea"],
//                   @"H" : @[@"Hippopotamus", @"Horse"],
//                   @"K" : @[@"Koala"],
//                   @"L" : @[@"Lion", @"Llama"],
//                   @"M" : @[@"Manatus", @"Meerkat"],
//                   @"P" : @[@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear"],
//                   @"R" : @[@"Rhinoceros"],
//                   @"S" : @[@"Seagull"],
//                   @"T" : @[@"Tasmania Devil"],
//                   @"W" : @[@"Whale", @"Whale Shark", @"Wombat"]
//                   
//                };
    
    NSArray* items = @[@"Bear", @"Black Swan"];
    
    self.items = [[NSMutableDictionary alloc]init];
    [self.items setObject:items forKey:@"B"];
    [self.items setObject:items forKey:@"C"];


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        NSArray* itemSectionTitles = [self.items allKeys];
    
    return [itemSectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
        NSArray* itemSectionTitles = [self.items allKeys];
    
    
    NSString *sectionTitle = [itemSectionTitles objectAtIndex:section];
    NSArray *sectionItems = [self.items objectForKey:sectionTitle];
    return [sectionItems count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSArray* itemSectionTitles = [self.items allKeys];
    
    // Return the number of rows in the section.
    NSString *sectionTitle = [itemSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionItems = [self.items objectForKey:sectionTitle];
    
    cell.textLabel.text = [sectionItems objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray* itemSectionTitles = [self.items allKeys];
    return [itemSectionTitles objectAtIndex:section];
}

int cnt = 0;

- (void)tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected section:%d  row:%d",indexPath.section,indexPath.row);
    
    cnt ++;
    
    NSString* key = [NSString stringWithFormat:@"%d", cnt];
    
    NSArray* mvitems = @[@"one",@"two"];
    [self.items setObject:mvitems forKey:key];
    
    
    NSLog(@"%@",[self.items objectForKey:@"B"]);
    
    
    
    [self.myTableView reloadData];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
