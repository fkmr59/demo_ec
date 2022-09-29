class TestsController < ApplicationController

  def index
  end

  def pay
    require 'payjp'
    Payjp.api_key = "sk_test_9b54572d69676cf4d152578e"
    Payjp::Charge.create(
      :amount => 8000, # 決済する値段
      :card => params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      :currency => 'jpy',
    )
  end

end

