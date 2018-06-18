json.initiatives do
  json.array!(@initiatives) do |initiative|
    json.title initiative.title
    json.url initiative_path(initiative)
  end
end
