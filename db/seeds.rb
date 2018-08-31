# frozen_string_literal: true

unless Admin.first
  Admin.create(email: ENV['EMAIL'], password: ENV['PASSWORD'])
end
