module Methods
  def set_bucket(bucket)
    @bucket = get_bucket_obj(bucket)
    # @bucket = bucket
  end

  private
    def get_bucket_obj(bucket_name)
      s3 = Aws::S3::Resource.new(access_key_id: ENV["access_key_id"], secret_access_key: ENV["secret_access_key"], endpoint: ENV["endpoint"], region: ENV["region"] )
      return s3.bucket(bucket_name)
    end
end
ActiveStorage::Service.module_eval { attr_writer :bucket }
ActiveStorage::Service.class_eval { include Methods }
