# frozen_string_literal: true

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.match?(/\A\+38\d{10}|^[0]\d{9}\z/i)

    record.errors[attribute] << (options[:message] || 'Unknown format number: 099ххххххх')
  end
end
