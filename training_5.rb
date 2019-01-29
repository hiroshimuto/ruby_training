# ハッシュとはキーと値の組み合わせでデータを管理するオブジェクトのこと
# 配列とは複数のデータをまとめて格納できるオブジェクトのこと
# ハッシュは {}で囲われていて、配列は[]で囲われている

## 具体例
a = {'japan' => 'yen', 'us' => 'dollar'}
puts a #⇛ {"japan"=>"yen", "us"=>"dollar"}
### japanがキーにあたり、yenが値となる。

## 要素の追加、変更、取得

## 追加
### ハッシュ[キー] = 値 で追加可能
### ハッシュaにitalyというキーでeuroという値を追加する処理
a['italy'] = 'euro'
puts a #⇛{"japan"=>"yen", "us"=>"dollar", "italy"=>"euro"}
### すでに要素が存在している場合は上書きされる
a['japan'] = '円'
puts a #⇛{"japan"=>"円", "us"=>"dollar", "italy"=>"euro"}

## 取得
### ハッシュ[キー] で値の取得可能
a['japan']
puts a['japan'] #⇛円

## ハッシュを使った繰り返し処理

### eachメソッドを使うと、キーと値の組み合わせを順に取り出せる
a = {'japan' => 'yen', 'us' => 'dollar', 'italy' => 'euro'}
a.each do |key, value|
  puts "#{key}:#{value}"
end
#⇛ japan:yen
#⇛ us:dollar
#⇛ italy:euro

## ハッシュの同値比較、要素数の取得、要素の削除
## ハッシュの同値比較
### == でハッシュ同士を比較できる
a = {'x' => 1, 'y' => 2, 'z' => 3}
b = {'x' => 1, 'y' => 2, 'z' => 3}
c = {'y' => 2, 'z' => 3, 'x' => 1}
d = {'x' => 10, 'y' => 20, 'z' => 30}

# キーも値も同じであるためtrueが返る
puts a == b #⇛ true
# 順番は違うけれどキーも値も同じであるためtrueが返る
puts a == c #⇛ false
# キーと値が異なるためfalseが返る
puts a == d #⇛ true

## 要素数の取得
### sizeメソッド(lengthメソッド)を使えばハッシュの要素の個数を調べられる
puts a.size #⇛3
puts a.length #⇛3

## 要素の削除
### deleteメソッドで指定したキーに対応する要素を削除できる
a.delete('x')
puts a #⇛{"y"=>2, "z"=>3}




