class System::Host < ApplicationRecord
  def self.url
    System::AddressServer.first.url
  end

  def self.site_name
    'Authorization provider 001'
  end

  def self.address_servers
    response =
      HTTParty
      .get(System::Host.url + '/api/v1/mx_address_servers.json', format: :plain)
    JSON.parse( response, symbolize_names: true)
  end

  def self.public_ledger
    public_ledgers.first
  end

  def self.public_ledgers
    address_servers.first[:url]
    response =
      HTTParty
      .get(url + '/api/v1/mx_public_ledgers.json', format: :plain)
    JSON.parse( response, symbolize_names: true)
  end
end