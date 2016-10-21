//
//  FoundsViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FoundsViewController.h"
#import "TopCell.h"
#import "BottomViewCell.h"
#import "ContentViewController.h"
#import "ArticlesViewController.h"
#import "PicClassViewController.h"

@interface FoundsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSArray *foundIDS;

@end

@implementation FoundsViewController

-(NSArray *)foundIDS{
    if (!_foundIDS) {
        _foundIDS = @[@"54589217586df56fb172b4c5",@"5451f506586df593cccf3f3b",@"556eb6313b0d31b17a1c6ba4",@"545899d9586df56fb059b344",@"5459a47b586df50df83e0c38",@"556eb6313b0d31b17a1c6ba4",@"5459865d586df50df83e09c2",@"5458bc6f586df50df83e066b",@"5459a194586df50df73cfa58",@"5459b62e586df50df83e0c3a",@"55670380586df543f2fb7642",@"5459eb0f586df55f984a33d8",@"5567cfeb3b0d313bc965f18f",@"54589f35586df57cb221afc4",@"54598b1e586df50df73cf8eb",@"5567040e3b0d312574e04a60"];
    }
    return _foundIDS;
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(-33);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TopCell" bundle:nil] forCellReuseIdentifier:@"TopCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BottomViewCell" bundle:nil] forCellReuseIdentifier:@"BottomViewCell"];
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return @"内容推荐";
    }else if (section == 2){
        return @"图片分类";
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0 || indexPath.row == 2) {
            ContentViewController *vc = [[ContentViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            if (indexPath.row == 0) {
                vc.headTitle = @"热门图片";
            }else if (indexPath.row == 2){
                vc.headTitle = @"好物";
            }
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            ArticlesViewController *vc = [[ArticlesViewController alloc] init];
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 3;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 30;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 70;
    }else if (indexPath.section == 1){
        return 45;
    }else{
        return 635;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        TopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell"];
        return cell;
    }else if(indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"yl11"];
            cell.textLabel.text = @"热门图片";
        }else if (indexPath.row == 1){
            cell.imageView.image = [UIImage imageNamed:@"ty11"];
            cell.textLabel.text = @"文章";
        }else{
            cell.imageView.image = [UIImage imageNamed:@"qc11"];
            cell.textLabel.text = @"好物";
        }
        return cell;
    }else{
        BottomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BottomViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        for (UIButton *button in cell.buttons) {
            [button bk_addEventHandler:^(UIButton *sender) {
                PicClassViewController *vc = [[PicClassViewController alloc] initWithPicID:self.foundIDS[sender.tag] andTitleName:sender.titleLabel.text];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            } forControlEvents:UIControlEventTouchUpInside];
        }
        return cell;
    }
}

@end












































