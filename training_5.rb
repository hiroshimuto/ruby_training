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
