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

# シンボル
## シンボルは、ソース上では文字列のように見え、内部では整数として扱われる、両者を仲立ちするような存在です。(リファレンスより)

### 特徴として、内部で整数として扱われるため処理が文字列よりも高速
### 同じシンボルであれば、全く同じオブジェクトであると判別するためメモリの使用効率がよくなる

# 確認
puts :apple.object_id #⇛899868
puts :apple.object_id #⇛899868
puts :apple.object_id #⇛899868

puts "apple".object_id #⇛70126019934900
puts "apple".object_id #⇛70126019934840
puts "apple".object_id #⇛70126019934780

### シンボルはいイミュータブルであるため、破壊的な変更はできない、つまり何か勝手に変更されるリスクがない。
a = "apple"
puts a.upcase! #⇛APPLE 文字列だと変更される
a = :apple
#puts a.upcase! #⇛undefined method `upcase!' シンボルだとエラーになる

## ハッシュのキーにシンボルを使う
### その際は シンボル:値 という記法になる事に注意！
a = {japan:'yen', us:'dollar'} #⇛{:japan=>:yen, :us=>:dollar}
### キーも値もシンボルである場合は以下のようになる
a = {japan: :yen, us: :dollar} #⇛{:japan=>:yen, :us=>:dollar}

# %記法でシンボルやシンボルの配列を作成する
a = :apple
puts a
## 上記は以下のように書き換えられる
## !は区切り文字につかう
puts %s!apple!

## シンボルの配列を作成するときは %i を使うことが可能、この時空白文字が要素の区切りになる
puts %i(apple orange grape) #⇛[:apple, :orange, :grape]

### deviseなどで独自のカラムを追加する時などに使える。
## devise_parameter_sanitizer.permit(:sign_up, keys: [:hoge, :hoge])は以下のようになる
## devise_parameter_sanitizer.permit(:sign_up, keys: %i(hoge hoge))







