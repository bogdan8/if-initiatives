# frozen_string_literal: true

every 1.day do
  rake 'initiatives:is_fundraised'
end
