class Highlight < ActiveRecord::Base

  validates_presence_of :hostname

  before_save :default_values
  def default_values
    unless self.port
      self.port = self.protocol == "https:"  ? 443 : 80 
    end
  end

  scope :hostname, -> (h) { where hostname: h }
  scope :pathname, -> (p) { where pathname: p }
  scope :port, -> (p) { where port: p }
  scope :protocol, -> (i) { where protocol: i }
  scope :pathname_hash, -> (h) { where pathname_hash: h }
  scope :search, -> (h) { where search: h }

  belongs_to :user
end
