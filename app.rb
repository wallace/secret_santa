require 'rubygems'
require 'sinatra'
require 'rqrcode'

list = []
10.times do
  list << SecureRandom.hex
end

get "/#{list[-1]}" do
  erb :finish
end

get "/:qr_code" do
  qr_index = list.index(params[:qr_code])
  @next_qr_text = list[qr_index + 1]
  @qr = RQRCode::QRCode.new(@next_qr_text)
  erb :index
end

get "/" do
  @next_qr_text = list[0]
  @qr = RQRCode::QRCode.new(@next_qr_text)
  erb :index
end

