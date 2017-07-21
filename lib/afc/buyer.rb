class Buyer
  attr_accessor :name, :address, :city, :state, :postal_code, :country_code

  def initialize(args={})
    @name = args[:name] || "MISSING"
    @address = args[:address] || "MISSING"
    @city = args[:city] || "MISSING"
    @state = args[:state] || "MISSING"
    @postal_code = args[:postal_code] || ""
    @country_code = args[:country_code] || "USA"
  end

  def ==(other)
    name == other.name \
      && address == other.address \
      && city == other.city \
      && state == other.state \
      && postal_code == other.postal_code \
      && country_code == other.country_code
  end

  def hash
    name.hash ^ address.hash
  end

  def eql?(other)
    name == other.name && address == other.address
  end

  def to_csv(amount)
    "#{name},#{address},#{city},#{state},#{postal_code},#{country_code},#{amount}"
  end

  def self.csv_header
    "name,address,city,state,postal_code,country,amount"
  end


end
