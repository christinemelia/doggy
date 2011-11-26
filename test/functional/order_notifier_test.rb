require 'test_helper'
class OrderNotifierTest < ActionMailer::TestCase
test "received" do
  mail = OrderNotifier.received(orders(:one))
  assert_equal "Dog Grooming services Order Confirmation", mail.subject
 assert_equal ["cc@example.org"], mail.to
 assert_equal ["dgrooming@example.com"], mail.from
 assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
end
test "shipped" do
 mail = OrderNotifier.shipped(orders(:one))
 assert_equal "Dog Groomin Services Order Paid", mail.subject
 assert_equal ["cc@example.org"], mail.to
 assert_equal ["dgrooming@example.com"], mail.from
 assert_match /<td>1&times;<\/td>\s*<td>Furminator<\/td>
 mail.body.encoded
end
end

