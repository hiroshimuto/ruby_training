# ブロックを使い配列のメソッド
## map/collect
## select/find_all/reject
## find/detect
## inject/reduce

### mapメソッドは、要素の数だけ繰り返しブロックを実行し、ブロックの戻り値を集めた配列を作成して返す
numbers = [1,2,3,4,5,6]
new_numbers = numbers.map{|n| n*10}
puts new_numbers #⇛[10,20,30,40,50,60]

### selectメソッドは、条件に合う要素を探して集めます。
numbers = [1,2,3,4,5]
#ブロックの戻り値が真になった要素だけが集められる
even_numbers = numbers.select{|n| n.even?}
puts even_numbers #⇛[2,4]

### rejectメソッドはselectメソッドの逆。真になった要素を除外して新たな配列が生成される。
numbers = [1,2,3,4,5]
#ブロックの戻り値が真になった要素だけが除かれる
even_numbers = numbers.reject{|n| n.even?}
puts even_numbers #⇛[1,3,5]

### findメソッドはブロックの戻り値が真になって要素のうち最初の要素を取得
numbers = [1,2,3,4,5]
#ブロックの戻り値が真になった要素の最初の要素だけが取得される
even_numbers = numbers.find{|n| n.even?}
puts even_numbers #⇛[2]

### injectメソッドはブロックを使って繰り返し計算を行うのに使用。いまいち分かりづらいので、実際のコードを交えて説明。

numbers = [1,2,3,4]
sum = 0
numbers.each{|n| sum+=n}
puts sum #⇛10

### 上記のコードはinjectを使うと以下のようになる
numbers = [1,2,3,4]
sum = numbers.inject(0){|result,n| result + n}
puts sum #⇛10

### 何が行われているかというと
### ブロックの第一引数resultには初回のみinjectの引数(0)が代入される。
### 2回目以降はブロックの戻り値が入る。
### ブロックの第二引数nにはnumbersの要素が順番に入る。
### 1回目：result = 0, n=1, result(0)+n(1)=1, 次のresultには1が入る
### 2回目： result = 1, n=2, result(1)+n(2)=3 次のresultには3が入るといった形で繰り返す。
### numbers全ての要素に対してブロック内の処理が終わったら、injectメソッドの戻り値となる。

## &とシンボル(:)を使って簡潔に書く

['ruby','java','html',].map{|s| s.upcase}
#⇛["RUBY", "JAVA", "HTML"]

### 上記のコードは以下のように書ける
['ruby','java','html',].map(&:upcase)
### ブロックを渡す代わりに、(&:メソッド名)という引数を渡している
### これは①ブロック引数が1個だけである、②ブロックの中で呼び出すメソッドには引数が無い、③ブロックの中ではブロック引数に対してメソッドを1回呼び出す以外の処理がないという条件が揃っている時に使える

### 以下の状態では使えない
[1,2,3,4,5].select{|n| n%3 == 0}
#ブロックの中でメソッドではなく演算子を使っている

[9,10,11,12].map{|n| n.to_s(16)}
#ブロック無いのメソッドで引数を渡している

[1,2,3,4,5].map do |n|
  m = n + 4
  m.to_s
end
#ブロック内で複数の文を実行している
