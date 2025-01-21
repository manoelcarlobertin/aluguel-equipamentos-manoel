json.extract! customer, :id, :name, :dob, :email, :mobile_phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
