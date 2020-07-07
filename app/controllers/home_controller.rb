class HomeController < ApplicationController
  
  def index
    @failed_charges = transactions_summary(false)
    @successful_charges = transactions_summary(true)
    @dispute_charges = transactions_summary(nil)
  end

  def transactions_summary status
    charges = []
    combine = []
    CreditCardCharge.all.each do |value|
      charges << value.records if value.records['paid'] == status
    end
    charges.each do |val|
      customer_name = Customer.where(id: val["customer_id"]).first.first_name
      combine << [customer_name, val]
    end
    combine
  end
end
