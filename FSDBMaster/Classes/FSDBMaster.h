//
//  FSDBMaster.h
//  Demo
//
//  Created by fudon on 2017/5/16.
//  Copyright © 2017年 fuhope. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull _db_extension = @".db";
static NSString * _Nullable _db_first_name = @"sql_ling";

@interface FSDBMaster : NSObject

///*
// * 使用Bundle中的一个数据库
// */
//+ (void)setBundleFile:(NSString *_Nullable)fileName;

// 打开数据库，传入数据库路径
+ (BOOL)openSQLite3:(NSString *_Nullable)path;

/**
 * 打开默认数据库
 */
+ (FSDBMaster *_Nullable)sharedInstance;

// 默认数据库路径
+ (NSString *_Nullable)dbPath;

/*
 新增 eg.
 @"INSERT INTO %@ (a,b,c,d) VALUES ('%@','%@','%@','%@');";
 */
- (NSString *_Nullable)insertSQL:(NSString *_Nullable)sql;  // 不稳定的方法，如果参数中带'符号，会失败，使用insert_fields_values:table:方法
- (NSString *_Nullable)insert_fields_values:(NSDictionary<NSString *,id> *_Nullable)list table:(NSString *_Nullable)table;

/*
 删除  eg
 @"DELETE FROM %@ WHERE time = '%@';"
 注意time的值，time是字符串，所以要用''来表示，如果time是字符型数字时加不加''都没关系，但如果time是155555.8888之类时，因为那个小数点导致必须加上''才能找到time
 */
- (NSString *_Nullable)deleteSQL:(NSString *_Nonnull)sql;
- (NSString *_Nullable)deleteSQL:(NSString *_Nonnull)table aid:(NSInteger)aid;

// @"UPDATE %@ SET lati = '%@',loti = '%@' WHERE aid = %@;"
- (NSString *_Nullable)updateSQL:(NSString *_Nonnull)sql; // 不稳定的方法，如果参数中带'符号，会失败，使用updateTable:fvs:where方法
- (NSString *_Nullable)updateTable:(NSString *_Nonnull)table fvs:(NSDictionary *_Nonnull)fvs where:(NSString *_Nonnull)format, ...;

/**
 *  直接执行SQL语句，
 *  不稳定的方法，如果参数中带'符号，可能失败，参考updateTable:fvs:where方法
 */
- (NSString *_Nullable)execSQL:(NSString *_Nonnull)sql;

/*
 【SELECT DISTINCT name FROM %@;】// 从%@表中查询name字段的所有不重复的值
 【SELECT * FROM %@ WHERE name = 'ddd';】
 【SELECT * FROM %@ order by time DESC limit 0,10;】    ASC
 【SELECT * FROM %@ WHERE atype = ? OR btype = ? and time BETWEEN 1483228800 AND 1514764799 order by time DESC limit 0,10;】
 */
- (NSMutableArray<NSDictionary *> *_Nullable)querySQL:(NSString *_Nullable)sql tableName:(NSString *_Nullable)tableName;

//  检查表是否存在
- (BOOL)checkTableExist:(NSString *_Nullable)tableName;

// 往表中增加字段  成功返回nil，失败返回原因
- (NSString *_Nullable)addField:(NSString *_Nullable)field defaultValue:(NSString *_Nullable)value toTable:(NSString *_Nullable)table;

// 删除表  成功返回nil，失败返回原因
- (NSString *_Nullable)dropTable:(NSString *_Nullable)table;

//  获取表名的所有数据数量
- (NSInteger)countForTable:(NSString *_Nullable)tableName;

/*
 根据sql语句获取满足条件的数据数量；count(*)内部可以是*，也可是字段名来限制范围。
 【select count(*) from dbgroup Where cast(freq as INTEGER) > 30;】查询满足条件的数据条数；
 【select count(DISTINCT type) from dbgroup;】查询type不同种类，比如type有password和diary两种，就返回2;
 */
- (int)countWithSQL:(NSString *_Nullable)sql table:(NSString *_Nullable)table;

// 获取数据库中所有表名
- (NSArray<NSString *> *_Nullable)allTables;
- (NSArray<NSDictionary *> *_Nullable)allTablesDetail;
// 获取表中的所有字段
- (NSArray<NSDictionary *> *_Nullable)allFields:(NSString *_Nullable)table;

/*
 所有关键字，不能用作表名或字段名
 */
- (NSArray<NSString *> *_Nullable)keywords;

//线程安全  iOS是2，2：支持多线程但不支持一个数据库在多线程内，即只支持一个数据库对应一个线程的多线程
+ (int)sqlite3_threadsafe;


/*
 *  存储二进制
 *  @param data：二进制
 *  @param table：表名
 *  @param key：检索字
 *
 *  返回值：错误
 */
- (NSString *_Nullable)insertData:(nonnull NSData *)data table:(nonnull NSString *)table key:(nonnull NSString *)key;

/************************** - 事务 - *************************************/

/**
 * sql参数：1为开始事务，2为提交事务，3为回滚事务
 * return：error信息，为nil则表示事务操作成功
 */
- (NSString *_Nullable)transactionHandler:(NSInteger)type;


/**
 *  把from表的数据拷贝到to表里
 */
+ (NSString *_Nullable)copyTable:(NSString *_Nullable)from to:(NSString *_Nullable)to;

@end



