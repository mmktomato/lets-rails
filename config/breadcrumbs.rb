crumb :blogs do
  link "Blogs", blogs_path
end

crumb :new_blog do
  link "New blog", new_blog_path
  parent :blogs
end

crumb :show_blog do |blog|
  link blog.title, blog_path(id: blog.id)
  parent :blogs
end

crumb :edit_blog do |blog|
  link "Edit blog", edit_blog_path(id: blog.id)
  parent :show_blog, blog
end

crumb :new_article do |blog|
  link 'New Article', new_article_path(blog_id: blog.id)
  parent :show_blog, blog
end

crumb :edit_article do |blog, article|
  link article.title, edit_article_path(blog_id: blog.id, id: article.id)
  parent :show_blog, blog
end
