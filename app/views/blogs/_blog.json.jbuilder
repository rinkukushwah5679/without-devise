json.extract! blog, :id, :image, :created_at, :updated_at
json.url blog_url(blog, format: :json)