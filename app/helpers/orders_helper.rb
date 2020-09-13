module OrdersHelper

  #数値に変換可能かを確認
  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
 end

end
