//
//  StatusViewController.m
//  Master
//
//  Created by Victor Munhoz Theodoro on 07/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "StatusViewController.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tarefasStatus = [[NSMutableArray alloc]init];
    _tarefaStatusTipo = [[NSMutableArray alloc]init];
    _menssagens = [[NSMutableArray alloc]init];
    
    //pega do DB as tarefas gerais e por tipo
    _tarefasStatus = [GerenciadorBD getTarefas];
    _tarefaStatusTipo = [GerenciadorBD getTarefasType:@"estudo"];
    
    [self barsAnimation];
    [self motivationMsg];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//método para a construção das barras de status com feedback de tarefas
-(void)barsAnimation{
    
    int nMaior;
    int nMenor;
    
    float tamMenor;

    
    if ([_tarefaStatusTipo count] > [_tarefasStatus count]) {
        nMaior = [_tarefaStatusTipo count];
        nMenor = [_tarefasStatus count];
        _textoMaior = [[NSString alloc]initWithFormat:@"da categoria:%d",_tarefaStatusTipo.count];
        tamMenor = (nMenor*100/nMaior)*3;
        
        
    }
    else{
        nMaior = [_tarefasStatus count];
        nMenor = [_tarefaStatusTipo count];
        _textoMaior = [[NSString alloc]initWithFormat:@"em aberto:%d",_tarefasStatus.count];
        tamMenor = (nMenor*100/nMaior)*3;
        
    }
    
    _labelMaior = [[UILabel alloc]initWithFrame:CGRectMake(10, 250, 300, 100)];
    _labelMaior.text = _textoMaior;
    [[self labelMaior]setTextColor:[UIColor grayColor]];
    [[self view]addSubview:_labelMaior];


    
    NSLog(@"%d %d",nMaior, nMenor);
    
    //animação barra maior
    
    UIView *taskBarMaior = [[UIView alloc]initWithFrame:CGRectMake(10, 300, 1, 30)];
    taskBarMaior.backgroundColor = [UIColor blackColor];
    [[self view]addSubview:taskBarMaior];
    taskBarMaior.layer.anchorPoint = CGPointMake(0, 0);
    
    CABasicAnimation *grow = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    grow.toValue = [NSNumber numberWithFloat:300];
    grow.duration = 3;
    grow.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0 :0 :1 :0];
    grow.removedOnCompletion = NO;
    grow.fillMode = kCAFillModeForwards;
    [[taskBarMaior layer]addAnimation:grow forKey:nil];
    
    //animação barra menor
    
    UIView *taskBarMenor = [[UIView alloc]initWithFrame:CGRectMake(10, 380, 1, 30)];
    taskBarMenor.backgroundColor = [UIColor blackColor];
    [[self view]addSubview:taskBarMenor];
    taskBarMenor.layer.anchorPoint = CGPointMake(0, 0);
    
    CABasicAnimation *growMenor = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    growMenor.toValue = [NSNumber numberWithFloat:tamMenor];
    growMenor.duration = 3;
    growMenor.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0 :0 :1 :0];
    growMenor.removedOnCompletion = NO;
    growMenor.fillMode = kCAFillModeForwards;
    [[taskBarMenor layer]addAnimation:growMenor forKey:nil];
    
    
    

    
}
//método para aparecer e tratar as mensagens motivacionais
-(void)motivationMsg{
    
    //adiciona a label a view
    _labelMsg = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 300, 300)];
    _labelMsg.text = @"Muito Bom! Ainda tem trabalho a fazer";
    _labelMsg.numberOfLines = 2.0;
    _labelMsg.font = [UIFont fontWithName:@"Helvetica" size:28.0];
    [[self view]addSubview:_labelMsg];
    
    //anima a label em opacidade
    CABasicAnimation *opacLabel = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacLabel.fromValue = [NSNumber numberWithFloat:0.0];
    opacLabel.toValue = [NSNumber numberWithFloat:1.0];
    opacLabel.duration = 2;
    opacLabel.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0 :0 :1 :0];
    opacLabel.removedOnCompletion = NO;
    opacLabel.fillMode = kCAFillModeForwards;
    [[_labelMsg layer]addAnimation:opacLabel forKey:nil];
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

//método para encerrar a tela de status
- (IBAction)closeView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismiss completed");
    }];
}
@end
