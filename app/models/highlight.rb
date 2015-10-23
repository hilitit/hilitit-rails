class Highlight < ActiveRecord::Base

  scope :host, -> (h) { where host: h }
  scope :path, -> (p) { where path: p }
  scope :port, -> (p) { where port: p }
  scope :is_https, -> (i) { where is_https: i }

  belongs_to :user
end
