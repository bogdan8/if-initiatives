# frozen_string_literal: true

unless Admin.first
  Admin.create(email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'])
end
