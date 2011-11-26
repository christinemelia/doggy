#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
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
        testng 
      </p>},
  :image_url => '/images/ruby.jpg',
  :price => 49.50)
# . . .

Product.create(:title => 'test agains',
  :description => 
    %{<p>
        <em>testinf if this works 
      </p>},
  :image_url => '/images/rtp.jpg',
  :price => 43.75)
