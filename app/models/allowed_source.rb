class AllowedSource < ApplicationRecord
  attr_accessor :last_octet, :_destroy

  before_validation do
    if last_octet
      self.last_octet = last_octet.strip
      if last_octet == "*"
        self.octet4 = 0
        self.wildcard = true
      else
        self.octet4 = last_octet.to_i
      end
    end
  end

  validates :octet1, :octet2, :octet3, :octet4, presence: true,
            numericality: { only_integer: true, allow_blank: true },
            inclusion: { in: 0..255, allow_blank: true }
  validates :octet4,
            uniqueness: { scope: [:namespace, :octet1, :octet2, :octet3], allow_blank: true }
  validates :last_octet,
            inclusion: { in: (0..255).to_a.map(&:to_s) + ["*"], allow_blank: true }

  after_validation do
    if last_octet
      errors[:octet4].each { |message| errors.add(:last_octet, message) }
    end
  end

  def ip_address=(ip_address)
    octets = ip_address.to_s.split(".")
    self.octet1 = octets[0].to_i
    self.octet2 = octets[1].to_i
    self.octet3 = octets[2].to_i

    if octets[3] == "*"
      self.octet4 = 0
      self.wildcard = true
    else
      self.octet4 = octets[3].to_i
      self.wildcard = false
    end
  end

  class << self
    def include?(namespace, ip_address)
      return true unless Rails.application.config.baukis2[:restrict_ip_addresses]

      octets = ip_address.split(".").map(&:to_i)
      
      where(namespace: namespace)
        .where(octet1: octets[0], octet2: octets[1], octet3: octets[2])
        .where("octet4 = ? OR wildcard = ?", octets[3], true)
        .exists?
    end
  end
end