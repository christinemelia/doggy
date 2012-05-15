#christine melia 
# encoding: utf-8
Product.delete_all
Product.create(:title => 'test',
  :description => 
    %{<p>
       test 
      </p>},
  :image_url =>   '/images/wd4d.jpg',    
  :price => 42.95)
# . . .
Product.create(:title => 'testing',
  :description =>
    %{<p>
        testing 
      </p>},
  :image_url => '/images/ruby.jpg',
  :price => 49.50)
# . . .

Product.create(:title => 'test agains',
  :description => 
    %{<p>
        <em>testing if this works 
      </p>},
  :image_url => '/images/rtp.jpg',
  :price => 43.75)
