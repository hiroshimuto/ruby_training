require 'minitest/autorun'
require './lib/rgb'

class RgbTest < Minitest::Test
  # Minitesの特徴
  # ①クラス名はTestで始まるかTestで終わる事が多い
  # ②ファイル名とクラス名は合わせる
  # ③クラス名はくキャメルケース、ファイル名はスネークケースで書く
  # ④test_で始めるメソッドを探して実行する
  def test_to_hex
    # assert_equal b,a はbとaが等しければパスするというminitestのメソッド
    assert_equal '#000000', to_hex(0,0,0)
    assert_equal '#ffffff', to_hex(255,255,255)
    assert_equal '#043c78', to_hex(4,60,120)
  end

end
