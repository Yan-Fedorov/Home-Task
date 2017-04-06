//
//  ViewController.m
//  Home Task
//
//  Created by Ян on 02.04.17.
//  Copyright © 2017 Ян. All rights reserved.
//

#import "ViewController.h"
#import "Corporations.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *homeTask;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;



@property (nonatomic, strong) NSMutableArray *corporation;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showData {
    // для начала проверим структуру данных в нашем массиве
    NSLog(@"Data array %@", self.homeTask);
    
    // далее напишем логику для получения текстовых представлений каждого товара
    NSMutableArray *textRepresentation = [NSMutableArray array];
    
    // проиницианизируем массив товаров
    
    self.corporation = [[NSMutableArray alloc] init];
    
    for (NSDictionary *corporation in self.homeTask) {
        Corporations *itemObj = [[Corporations alloc] initWithDictionary:corporation];
        
        // теперь все объекты Item будем добавлять в массив items
        [self.corporation addObject:itemObj];
        
        if ([itemObj Default]) {
            [textRepresentation addObject:[itemObj itemDescription]];
        }
        
    }
}
-(void) readData
{
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"Corporation" withExtension:@"plist"];
    self.homeTask = [NSArray arrayWithContentsOfURL:fileURL];
}


@end
@interface DataViewController()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *corporation;

@property (nonatomic, strong) NSArray *homeTask;

@end
@implementation DataViewController
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showData {
    // для начала проверим структуру данных в нашем массиве
    NSLog(@"Data array %@", self.homeTask);
    
    // далее напишем логику для получения текстовых представлений каждого товара
    NSMutableArray *textRepresentation = [NSMutableArray array];
    
    // проиницианизируем массив товаров
    
    self.corporation = [[NSMutableArray alloc] init];
    
    for (NSDictionary *corporation in self.homeTask) {
        Corporations *itemObj = [[Corporations alloc] initWithDictionary:corporation];
        
        // теперь все объекты Item будем добавлять в массив items
        [self.corporation addObject:itemObj];
        
        if ([itemObj Default]) {
            [textRepresentation addObject:[itemObj itemDescription]];
        }
        
    }
}
-(void) readData
{
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"Corporation" withExtension:@"plist"];
    self.homeTask = [NSArray arrayWithContentsOfURL:fileURL];
}



#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // здесь необходимо указать количество элементов в секции таблицы
    return self.corporation.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // здесь описываем визуальное представление данных в ячейках таблицы
    // введем переменную-идентификатор типа ячейки
    // имя типа произвольное
    NSString *cellIdentifier = @"cellIdentifier";
    
    // здесь мы пробуем взять ячейку из очереди переиспользуемых дабы не создавать ее
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // если ячеек в очереди нет, создаем ее
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    // далее добавим визуальное отображение данных
    
    // получим товар
    Corporations *corporations = [self.corporation objectAtIndex:indexPath.row];
    cell.accessoryType = (corporations.Default) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
    cell.textLabel.text = corporations.title;
    cell.detailTextLabel.text = [corporations itemDescription];
    
    // уберем подсветку выделенной ячейки
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row % 2)
    {
        [cell setBackgroundColor:[UIColor grayColor]];
    }
    else [cell setBackgroundColor:[UIColor clearColor]];
    
    
    return cell;
}
- (CGFloat ) tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSString *)section
{
    section = @"Корпорации";
    return section;
}

// далее добавим реагирование на нажатие ячейки - этим занимается протокол UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // получаем выбранную ячейку
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    cell.accessoryType = (cell.accessoryType == UITableViewCellAccessoryCheckmark) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
}




@end
