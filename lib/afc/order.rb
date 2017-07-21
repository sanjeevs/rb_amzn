class Order 
  attr_accessor :order_id, :name, :address, :city, :state, :postal_code, :country_code
  attr_accessor :purchased_at, :amount, :phone

  def initialize(order_id, args={})
    @order_id = order_id
    @name = args[:name] || "MISSING"
    address = args[:address] || "MISSING" 
    @city = args[:city] || "MISSING"
    @state = args[:state] || "MISSING"
    @postal_code = args[:postal_code] || ""
    @country_code = args[:country_code] || "USA"
    @purchased_at = args[:purchased_at]
    @amount = args[:amount] || 0
    @phone = args[:phone] || ""

    @address = cleanup_address(address)
    @name.gsub!(',', ' ')
  end

  def cleanup_address(address)
    if address.kind_of?(Array)
      full_address = address.join(' ')
    else
      full_address = address
    end

    full_address.gsub!(',', ' ') 
  end

  def ==(other)
    order_id == other.order_id
  end

  def hash
    order_id
  end

  def eql?(other)
    order_id
  end

  def to_csv
    "#{order_id},#{purchased_at},#{name},#{address},#{city},#{state},#{postal_code},#{country_code},#{amount}"
  end

  def self.csv_header
    "order_id,purchase_date,name,address,city,state,postal_code,country,amount"
  end

end
