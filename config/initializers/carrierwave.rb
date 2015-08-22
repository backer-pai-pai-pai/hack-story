CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "#{ENV["AWS_ACCESS_KEY"]}",
    aws_secret_access_key: "#{ENV["AWS_SECRET_ACCESS_KEY"]}",
    region: "us-west-2"
  }
  config.fog_directory  = Rails.application.secrets.aws_bucket
  config.fog_attributes = { "Cache-Control" => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
