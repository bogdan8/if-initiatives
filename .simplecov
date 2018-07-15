SimpleCov.profiles.define 'if-initiatives' do
  add_filter '/spec/'
  add_filter '/config/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models',      'app/models'
  add_group 'Helpers',     'app/helpers'
end

SimpleCov.start 'if-initiatives'
