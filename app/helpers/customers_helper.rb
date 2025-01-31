# app/helpers/customers_helper.rb
module CustomersHelper
  def format_customer_name(customer)
    customer.name.present? ? customer.name.capitalize : "Nome não disponível"
  end
end
