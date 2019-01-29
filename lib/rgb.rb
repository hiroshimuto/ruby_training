def to_hex(r,g,b)
  hex = '#'
  [r,g,b].each{|n| hex += n.to_s(16).rjust(2,'0')}
  hex
end

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  # 空の配列を用意して、別の配列をループ処理した結果を空の配列に組み込む処理の大半はmapメソッドで置き換えられる
  [r,g,b].map do |s|
    s.hex
  end
end
