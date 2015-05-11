//
//  MZ-Default-View.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 10/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Default-View.h"
@interface MZ_Default_View () <MZ_Default_View_Delegate>
@property (weak, nonatomic) IBOutlet UIImageView *turnTable;
@property (weak, nonatomic) IBOutlet UIImageView *midIcon;

@property (weak, nonatomic) IBOutlet UILabel *descriptionBtn;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;

@property (weak, nonatomic) CADisplayLink *link;

- (IBAction)registerEvent:(UIButton *)sender;

- (IBAction)LoginEvent:(UIButton *)sender;
@end

@implementation MZ_Default_View

+ (instancetype)defaultCenterView
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MZ-Default-View" owner:nil options:nil];
    
    return [views lastObject];
    
//    return [[[NSBundle mainBundle] loadNibNamed:@"MZ-Default-View" owner:nil options:nil] lastObject];
    
}

- (void)setTurntableName:(NSString *)turntableName
{
    _turntableName = [turntableName copy];
    self.turnTable.image = [UIImage imageNamed:turntableName];
}
- (void)setMidIcontableName:(NSString *)midIcontableName
{
    _midIcontableName = [midIcontableName copy];
    self.midIcon.image = [UIImage imageNamed:midIcontableName];
}
- (void)setDescripition:(NSString *)descripition
{
    _descripition = [descripition copy];
    self.descriptionBtn.text = descripition;
}

- (IBAction)registerEvent:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(defaultCenterView:didClickRegisterBtn:)]) {
        [self.delegate defaultCenterView:self didClickRegisterBtn:sender];
    }
}

- (IBAction)LoginEvent:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(defaultCenterView:didClickLoginBtn:)]) {
        [self.delegate defaultCenterView:self didClickLoginBtn:sender];
    }
}

- (void)startRotate
{
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(begin)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.link = link;
}

- (void)begin
{
    self.turnTable.transform = CGAffineTransformRotate(self.turnTable.transform, M_PI/600);
}

- (void)stopRotate
{
    [self.link invalidate];
    self.link = nil;
}
@end
