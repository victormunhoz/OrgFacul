//
//  NewTypeViewController.m
//  master
//
//  Created by Victor Munhoz Theodoro on 10/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "NewTypeViewController.h"

@interface NewTypeViewController ()

@end

@implementation NewTypeViewController

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
    _iconsArray = [[NSMutableArray alloc]init];
    _dbTypes = [[NSMutableArray alloc]init];
    _imageTypePick = [[NSMutableArray alloc]init];
    
    _dbTypes = [GerenciadorBD getTypes];
    
    
    
    [[self typeNameLaber]resignFirstResponder];
    [[self typeNameLaber]setDelegate:self];
    
   
    for (int i = 0; i < 3; i++) {
        
        NSString *filepath = [NSString stringWithFormat:@"%d.png",i];
        UIImage *icon = [UIImage imageNamed:filepath];
        
        [[self iconsArray]addObject:icon];
    }
    
   
    
   
}

-(void)viewDidDisappear:(BOOL)animated{
    

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
 
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _iconsArray.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
     TypeCell *myCell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"MyCell"
                                    forIndexPath:indexPath];
    
    myCell.iconView.image = [[self iconsArray]objectAtIndex:indexPath.row];
    
    return myCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [[self imageTypePick]removeAllObjects];
    
    [[self imageTypePick]addObject:[[self iconsArray]objectAtIndex:indexPath.row]];
    
    NSLog(@"%i",_imageTypePick.count);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)createType:(id)sender {
    
    if(self.dbTypes.count <5 ){
        if ((self.typeNameLaber.text.length != 0) && !([self.typeNameLaber.text isEqual:@" "]) && (self.typeNameLaber.text.length < 20)){
            
            //transforma a imagem selecionada em NSData
            UIImage *iconImage = [[self imageTypePick]objectAtIndex:0];
            NSData *iconData = [NSData dataWithData:UIImagePNGRepresentation(iconImage)];
            
            //adiciona
            [GerenciadorBD criaType:self.typeNameLaber.text :iconData];
            [self dismissViewControllerAnimated:YES completion:^{
                NSLog(@"Dismiss Type View completed");
            }];
        }
    }
}

  

- (IBAction)cancelType:(id)sender {
    [self.delegate limpaERecria];
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismiss Type View completed");
    }];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [[self typeNameLaber]resignFirstResponder];
    return YES;
}


@end
