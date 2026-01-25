//
//  FSDBMaster.swift
//  FSKit
//
//  Created by Dongdong Fu on 2026/1/25.
//

import Foundation

class FSDBMaster {
        
    static var shareInstance: FSDBMaster = {
        // 这里可以写复杂的初始化逻辑
        let instance = FSDBMaster()
        return instance
    }()
    
    func openSQLite3(path: String) -> Bool {
        
        
        
        return true
    }
    
}

//- (BOOL)openSQLite3:(NSString *)path {
//    __block BOOL open = NO;
//    dispatch_sync(_queue, ^{
//        open = [self openSqlite3DatabaseAtPath:path];
//        NSAssert(open == YES, @"打开数据库失败");
//    });
//    
//#if DEBUG
//    NSInteger mode = [FSDBMaster sqlite3_threadsafe];
//    NSAssert(mode == 2, @"SQLite3线程模式不是2了？");
//#endif
//    return open;
//}
//
