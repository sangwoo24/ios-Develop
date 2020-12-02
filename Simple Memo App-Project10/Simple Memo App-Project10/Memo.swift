import Foundation

struct Memo{
    var title : String
    var contents : String
    
    init(_ title : String, _ contents : String) {
        self.title = title
        self.contents = contents
    }
}

class MemoManager{
    var memoList : [Memo] = []
    
    init() {
        let memo = Memo("제목", "내용")
        memoList.append(memo)
    }
    
    func addMemo(_ memo : Memo){
        memoList.append(memo)
    }
    
    func delMemo(_ index : Int){
        memoList.remove(at: index)
    }
    
    func moveMemo(_ source : Int, _ destination : Int){
        let memo = memoList.remove(at: source)
        memoList.insert(memo, at: destination)
    }
    
    func updateMemo(_ index : Int, _ memo : Memo){
        memoList[index].title = memo.title
        memoList[index].contents = memo.contents
    }
    
    func numOfMemoList() -> Int{
        return memoList.count
    }
    
    func printMemo(){
        for i in memoList{
            print(i)
        }
    }
}

