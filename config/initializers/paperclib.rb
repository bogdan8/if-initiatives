defaults = {
 storage: :s3,
 s3_credentials: {
   bucket: ENV['AMAZONE_BUCKET'],
   access_key_id: ENV['AMAZONE_KEY_ID'],
   secret_access_key: ENV['AMAZONE_SECRET_ACCESS_KEY']
 },
 s3_region: ENV['AMAZONE_REGION'],
 url: ':s3_domain_url',
 path: ':class/:attachment/:id/:style/:filename',
}

defaults.each do |key, value|
 Paperclip::Attachment.default_options[key] = value
end
