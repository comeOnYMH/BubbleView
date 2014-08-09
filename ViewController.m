//
//  ViewController.m
//  BubbleView
//
//  Created by 杨名海 on 14-8-2.
//  Copyright (c) 2014年 杨名海. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(UIView *)bubbleView:(NSString *)text from:(BOOL)fromBool;
@end

@implementation ViewController
@synthesize showBubble;
/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

-(id)init{
    self = [super init];
    if(self){
        showBubble = [[UIView alloc] init];
        showBubble = [self bubbleView:@"大家好，才是真的好,虎岛和夫"
                      "风雨国际格局与国家根据回顾 u国家改革v 计划i 哦 hi方法论加夫里什决定建立了集" from:1];
        [self.view addSubview:showBubble];
        
    }
    return self;
}
-(UIView *)bubbleView:(NSString *)text from:(BOOL)fromBool{
    //使用给定的文本创建聊天气泡
    
    UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    returnView.backgroundColor = [UIColor clearColor];
    
    //根据箭头不同的方向选择不同的气泡图片
    UIImage *bubble = [UIImage imageNamed:@"bubble.png"];
    //对气泡图片进行拉伸
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:
                                    [bubble stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0]];
    
    UIFont *font = [UIFont systemFontOfSize:13];
    //获取文字所占字体的大小
    CGSize size = [text boundingRectWithSize:CGSizeMake(150.0f, 1000.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(21, 14, size.width+15,size.height)];
    bubbleText.backgroundColor = [UIColor clearColor];
    bubbleText.font = font;
    bubbleText.numberOfLines = 0;
    bubbleText.lineBreakMode = NSLineBreakByCharWrapping;
    bubbleText.text = text;
    
    bubbleImageView.frame = CGRectMake(0.0, 0.0, 200, size.height+40);
    if(fromBool){//己方
        returnView.frame = CGRectMake(120.0f, 10.0f, 200, size.height+50);
        
    }else{
        returnView.frame = CGRectMake(0.0f, 10.0f, 200.0f, size.height+50.0f);
    }

    [returnView addSubview:bubbleImageView];
    [returnView addSubview:bubbleText];
    return returnView;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
