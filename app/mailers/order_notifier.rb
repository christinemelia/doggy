class OrderNotifier < ActionMailer::Base
  default from: 'Dog Grooming <dgrooming@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #

def received(order)
    @order = order
    mail to: order.email, subject: 'Dog Grooming Services Confirmation'
 end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.paid.subject
  #

 def paid(order)
    @order = order
    mail to: order.email, subject: 'Dog Grooming Services Order Paid'
    end
end
