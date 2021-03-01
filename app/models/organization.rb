require 'aws-sdk-s3'
class Organization < ApplicationRecord
  has_one_attached :logo
  has_many :news

  before_create :generate_bucket_name

  after_create :create_s3_bucket

  def generate_bucket_name
    unless self.bucket_name.present?
      self.bucket_name = "#{self.name.split(" ").first.downcase}-#{SecureRandom.hex(5)}"
    end
  end
  
  def create_s3_bucket
    # debugger
    if self.bucket_name.present?
      client = Aws::S3::Client.new( access_key_id: ENV["access_key_id"], secret_access_key: ENV["secret_access_key"], endpoint: ENV["endpoint"], region: ENV["bucket_create_region"])
      client.create_bucket({ bucket: bucket_name, acl: "private" })
    end
  end
end
