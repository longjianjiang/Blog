//
//  LJTableViewCellHeight.m
//  AutoLayoutDemo
//
//  Created by longjianjiang on 2017/5/8.
//  Copyright © 2017年 Jiang. All rights reserved.
//

#import "LJTableViewCellHeight.h"
#import "FDFeedEntity.h"
#import "FDCustomCell.h"

@interface LJTableViewCellHeight ()
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *prototypeEntitiesFromJSON;
@end

@implementation LJTableViewCellHeight

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubview];
    [self setUpData];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(show) name:@"TestNotification" object:nil];
}

- (void)show {
    NSLog(@"right here");
}


- (void)setUpSubview {
    [self.view addSubview:self.tableView];
}

- (void)setUpData {
    // Data from `data.json`
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDicts = rootDict[@"feed"];
    
    // Convert to `FDFeedEntity`
    NSMutableArray *entities = @[].mutableCopy;
    [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [entities addObject:[[FDFeedEntity alloc] initWithDictionary:obj]];
    }];
    self.prototypeEntitiesFromJSON = entities;
    
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.prototypeEntitiesFromJSON.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FDCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(FDCustomCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    cell.entity = self.prototypeEntitiesFromJSON[indexPath.row];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    return [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(FDCustomCell* cell) {
    //        [self configureCell:cell atIndexPath:indexPath];
    //    }];
    
    static FDCustomCell *cell = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    });
    
    [self configureCell:cell atIndexPath:indexPath];
    CGFloat height = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}
#pragma mark getter and setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[FDCustomCell class] forCellReuseIdentifier:@"cell"];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}


@end
