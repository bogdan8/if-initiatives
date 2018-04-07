# frozen_string_literal: true

unless Role.any?
  Role.create(name: :user)
  Role.create(name: :administrator)
  Role.create(name: :moderator)
end
