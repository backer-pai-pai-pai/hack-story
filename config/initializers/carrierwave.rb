CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: "ap-northeast-1"
  }

  config.fog_directory  = Rails.application.secrets.aws_bucket
  config.fog_attributes = { "Cache-Control" => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
