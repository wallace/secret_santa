require 'sinatra'
require 'rqrcode'

list = []
10.times do
  list << SecureRandom.hex
end

things = [
  'if you are worried about getting fat from eating cereal, use a smaller bowl, it aint that gotdam difficult.',
  'fuck those fucking siege worms =/',
  'count me in, best part of the year =)',
  'so far so good, the mouse wheel feels a little loose, but the clickers are nice and it goes good with the mousepad... now to see how it holds up =)',
  'my womans vagina seems to unlock with footrubs, home cooked dinner and nipple tweaking.',
  'Top 5 people to get stoned with: 1. Jesus H Christ 5. Bob Marley 4. Will Ferrell 3. Richard Pryor',
  'after several hours of trying to actually get into the beta forums, i finally found a post that says the matchmaking system is derped and they are trying to fix it',
  'downloading cause my last name is Montague \o/',
  'nevermind',
  'I hope you enjoy them, it was more difficult than i thought it would be without a wishlist to get some ideas from. i got a few ideas from friends but ended up choosing option C. Option 1 was going to be 25$ worth of ramen, Option 2 was going to be a 12 pack sampler of some hawaiin beer, '
]

images = [
 '<a href="https://www.flickr.com/photos/jadendave/4857422954" title="oh yes by ModernDope (old account), on Flickr"><img src="https://farm5.staticflickr.com/4096/4857422954_66235a8df8_n.jpg" width="320" height="228" alt="oh yes"></a>',
 '<a href="https://www.flickr.com/photos/jlevine/4432285980" title="Worm Bin by Jacob Levine, on Flickr"><img src="https://farm3.staticflickr.com/2691/4432285980_73cf881b95_o.jpg" width="2048" height="1536" alt="Worm Bin"></a>',
 '<a href="https://www.flickr.com/photos/fernando/21613604" title="Count by Fernando de Sousa, on Flickr"><img src="https://farm1.staticflickr.com/15/21613604_dbc3db9f31_o.jpg" width="640" height="480" alt="Count"></a>',
 '<a href="https://www.flickr.com/photos/ikayama/117848873" title="Mickey Mouse vinyl by ikayama, on Flickr"><img src="https://farm1.staticflickr.com/54/117848873_441bec5937_o.jpg" width="652" height="488" alt="Mickey Mouse vinyl"></a>',
 '<a href="https://www.flickr.com/photos/gerrydincher/6252460806" title="Nipple Convalescent Home by Gerry Dincher, on Flickr"><img src="https://farm7.staticflickr.com/6043/6252460806_017af26cae_o.jpg" width="2472" height="1798" alt="Nipple Convalescent Home"></a>',
 '<a href="https://www.flickr.com/photos/dubpics/5619966355" title="Bob Marley by Eddie  / monosnaps, on Flickr"><img src="https://farm6.staticflickr.com/5029/5619966355_b853e5de83_o.jpg" width="1024" height="632" alt="Bob Marley"></a>',
 '<a href="https://www.flickr.com/photos/funadium/3882400725" title="Match by Marco Bernardini, on Flickr"><img src="https://farm3.staticflickr.com/2607/3882400725_a7c752d6c5_o.jpg" width="2016" height="3032" alt="Match"></a>',
 '<a href="https://www.flickr.com/photos/mtaphotos/14074938425" title="Montague Tube Work: April 29, 2014 by Metropolitan Transportation Authority of the State of New York, on Flickr"><img src="https://farm3.staticflickr.com/2935/14074938425_7f5359678d_o.jpg" width="1920" height="1278" alt="Montague Tube Work: April 29, 2014"></a>',
 '<a href="https://www.flickr.com/photos/palnordseth/7329657776" title="nevermind by Pål Nordseth, on Flickr"><img src="https://farm8.staticflickr.com/7216/7329657776_1c69c5aa24_o.jpg" width="600" height="600" alt="nevermind"></a>',
 '<a href="https://www.flickr.com/photos/geishabot/2058817800" title="ramen bowl figurines by Janine, on Flickr"><img src="https://farm3.staticflickr.com/2014/2058817800_0d39a56676_o.jpg" width="1024" height="702" alt="ramen bowl figurines"></a>'
]

get "/#{list[-1]}" do
  erb :finish
end

get "/:qr_code" do
  qr_index = list.index(params[:qr_code])
  @text = things[qr_index]
  @images = images[qr_index]
  @next_qr_text = list[qr_index + 1]
  @link = "https://sheltered-shore-8666.herokuapp.com/#{@next_qr_text}"
  @qr = RQRCode::QRCode.new(@link)
  erb :index
end

get "/" do
  @next_qr_text = list[0]
  @link = "https://sheltered-shore-8666.herokuapp.com/#{@next_qr_text}"
  @qr = RQRCode::QRCode.new(@link)
  erb :start
end

