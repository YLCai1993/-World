//
//  StoreViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "StoreViewController.h"
#import "ScrollDisplayViewController.h"
#import "DetailArticleViewController.h"
#import "DetailArticleViewController.h"
#import "PlayMuiscView.h"
#import "HeaderViewModel.h"
#import "NewsView.h"
#import "ListViewModel.h"
#import "ListCell.h"

#define kButtonH 32
#define kButtonW 64
#define kButtonW1 32
#define kLeftMargin 40
#define kMarginHer 22
#define KMarginVer 15
#define kColNumber 4

@interface StoreViewController ()<UITableViewDelegate,UITableViewDataSource,scrollDisplayViewControllerDelegate>

@property(nonatomic,strong)ScrollDisplayViewController *sdVC;
@property(nonatomic,strong)NSArray *topImageNames;
@property(nonatomic,strong)NSArray *topicNames;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)HeaderViewModel *HVM;
@property(nonatomic,strong)ListViewModel *LVM;
/* 获取Plist文件中的数据 */
@property(nonatomic,strong)NSArray *paths;

@end

@implementation StoreViewController

-(NSArray *)topImageNames{
    return @[@"cj",@"fc",@"fl",@"jk_2",@"js",@"jy",@"kj",@"ls"];
}

-(NSArray *)topicNames{
    return @[@"护肤",@"彩妆",@"个人护理",@"美食",@"文具手杖",@"家居",@"畅销单品",@"全部分类"];
}

-(HeaderViewModel *)HVM{
    if (!_HVM) {
        _HVM = [HeaderViewModel new];
    }
    return _HVM;
}

-(ListViewModel *)LVM{
    if (!_LVM) {
        _LVM = [ListViewModel new];
    }
    return _LVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"堆糖商店";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"line_cart"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"StorePath" ofType:@"plist"];
    self.paths = [NSArray arrayWithContentsOfFile:path];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil] forCellReuseIdentifier:@"ListCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    /*  添加礼包视图 */
    [self.view addSubview:[PlayMuiscView sharedInstance]];
    [[PlayMuiscView sharedInstance].playBtn bk_addEventHandler:^(UIButton *sender) {
        DetailArticleViewController *vc = [[DetailArticleViewController alloc] initWithURL:self.paths[sender.tag]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [[PlayMuiscView sharedInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.bottom.mas_equalTo(-74);
        make.size.mas_equalTo(CGSizeMake(37, 37));
    }];
    
    [self getData];
}

-(void)configTableView{
    if ([self.HVM getIconArr].count == 0) return;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 400 + 186)];
    [_sdVC removeFromParentViewController];
    
    _sdVC = [[ScrollDisplayViewController alloc] initWithImgPaths:[self.HVM getIconArr]];
    _sdVC.canCycle = YES;
    _sdVC.autoCycle = YES;
    _sdVC.showPageControl = NO;
    _sdVC.delegate = self;
    [self addChildViewController:_sdVC];
    [headView addSubview:_sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(210);
    }];
    self.tableView.tableHeaderView = headView;
    CGFloat originX = 0;
    for (NSInteger i = 0; i < 8; i++) {
        NSInteger row = (NSInteger) (i / kColNumber);  //当前行数
        NSInteger col = i % kColNumber;      //当前行数的第几个
        UIButton *button = [UIButton buttonWithType:0];
        button.tag = i;
        [button bk_addEventHandler:^(UIButton *sender) {
            DetailArticleViewController *vc = [[DetailArticleViewController alloc] initWithURL:[NSURL URLWithString:self.paths[sender.tag]]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:self.topImageNames[i]] forState:UIControlStateNormal];
        CGFloat buttonX = kLeftMargin + (kButtonW + kMarginHer)*col;
        CGFloat buttonY =210 + KMarginVer +(KMarginVer + kButtonH + 35) * row;
        button.frame = CGRectMake(buttonX, buttonY, kButtonW1, kButtonH);
        [headView addSubview:button];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = self.topicNames[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(buttonX - 15, buttonY + kButtonH + 10, kButtonW, 20);
        label.font = [UIFont systemFontOfSize:15];
        [headView addSubview:label];
        originX = CGRectGetMaxY(label.frame) + 10;
    }
    NewsView *newViwe = [[NSBundle mainBundle] loadNibNamed:@"NewsView" owner:nil options:nil].firstObject;
    newViwe.frame = CGRectMake(0, originX, kWindowW, 186);
    for (UIButton *button in newViwe.newsButton) {
        [button bk_addEventHandler:^(UIButton *sender) {
            DetailArticleViewController *vc = [[DetailArticleViewController alloc] initWithURL:[NSURL URLWithString:self.paths[sender.tag]]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    [headView addSubview:newViwe];
}

-(void)getData{
    [self.HVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self configTableView];
        if (error) {
            [self showErrorMsg:error];
        }
    }];
    
    [self.LVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self.tableView reloadData];
        if (error) {
            [self showErrorMsg:error];
        }
    }];
}


#pragma mark - UItableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.LVM rowNumber];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 280;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"你好";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 65;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[NSBundle mainBundle] loadNibNamed:@"HeaderViewForSection" owner:nil options:nil].firstObject;
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailArticleViewController *vc = [[DetailArticleViewController alloc] initWithURL:[self.LVM clickURLForRow:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    [cell.bgImageView sd_setImageWithURL:[self.LVM picURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"bgcell1"]];
    cell.descLabel.text = [self.LVM descForRow:indexPath.row];
    cell.sTitleLabel.text = [self.LVM sTitleForRow:indexPath.row];
    return cell;
}

#pragma mark - scrollDisplayViewControllerDelegate
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index{
    DetailArticleViewController *vc = [[DetailArticleViewController alloc] initWithURL:[self.HVM clickURLArr][index]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];   
}

@end



































