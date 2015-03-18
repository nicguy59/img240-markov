# see https://github.com/rails/jbuilder for instructions and syntax
json.created_at Time.now
json.authors @authors do |key, name|
  json.key    key
  json.name   name
  json.url    story_url(id: key)
  json.story  Story.new(key).to_s
end
