// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



$("#like-btn-<%= @post.id %>").replaceWith('<%= j(link_to post_like_path(@post, @post.likes.find_by(user: current_user)), method: :delete, remote: true, id: "like-btn-#{@post.id}", class: "btn btn-sm btn-danger") { "Unlike" }) %>');

$("#like-count-<%= @post.id %>").text("Likes: <%= @post.likes_count %>");
