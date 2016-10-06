Grid - Example
.col-md-8.col-md-offset-2
  12 cols, 8 offset by 2 on both sides = 12

*****SHOW PAGE*****

<div class="posts-wrapper row">
  <div class="post">
    <div class="post-head">
      <div class="name">
        xGhoul_
      </div>
    </div>
    <div class="image center-block">
      <%= image_tag @post.image.url(:medium) %>
    </div>
    <p class="caption">
      <%= @post.caption %>
    </p>
    <div class="text-center">
      <%= link_to 'Edit Post', edit_post_path(@post) %>
      <div class="br"></div>
      <%= link_to 'Back', posts_path %>
    </div>
  </div>
</div>

*****NEW*****

<%= render 'form' %>

*****INDEX*****

<div class="posts-wrapper row">
  <% @posts.each do |post| %>
    <div class="post">
      <div class="post-head">
        <div class="name">
          xGhoul_
        </div>
      </div>
      <div class="image center-block">
        <%= link_to (image_tag post.image.url(:medium), class:'img-responsive'), post_path(post) %>
      </div>
      <p class="caption">
        <%= post.caption %>
      </p>
    </div>
  <% end %>
</div>

@@@@ Add a Comment @@@

<div class="posts-wrapper row">
  <% @posts.each do |post| %>
    <div class="post">
      <div class="post-head">
        <div class="thumb-img"></div>
        <div class="user-name">
          <% post.user.user-name %>
        </div>
        <div class="image center-block">
          <%= link_to (image-tag post.image.url(:medium), class:'image-responsive'), post_path(post) %>
        </div>
        <div class="post-button">
          <div class="caption">
            <div class="user-name">
              <%= post.user.user_name %>
            </div>
            <%= post.caption %>
          </div>
          <% if post.comments %>
            <% post.comments.each do |comment| %>
              <div class="comment">
                <div class="user-name">
                  <%= comment.user.user_name %>
                </div>
                <div class="comment-content">
                  <%= comment.content %>
                </div>
                <% if comment.user == current_user %>
                  <%= link_to post_comment_path(post, comment), method: :delete, data: { confirm: "Are you sure?" } %>
                <% end %>
              </div>
            <% end %>
          <% end %>
          <div class="comment-form">
            <%= form_for [post, post.comments.new] do |f| %>
              <%= f.text_field :content, placeholder: "Add comment"  %>
            <% end %>
          </div>
        </div>
      </div>
    </div>
  <% end %>
</div>


*****EDIT*****

<div class="text-center">
  <%= image_tag @post.image.url(:medium) %>
</div>
<%= render 'form' %>
<div class="text-center">
  <%= link_to 'Delet this', post_path(@post), method: :delete, %>
  data: { confirm: "Are you sure you want to delet this?"}
</div>

*****F0RM*****

<div class="form-wrapper">
  <%= simple_form_for @post, html: { class: 'form-horizontal', multipart: true } do |f| %>
    <div class="form-group">
      <%= f.input :image %>
    </div>
    <div class="form-group text-center">
      <%= f.input :caption %>
    </div>
    <div class="form-group text-center">
      <%= f.button :submit, class: 'btn-success' %>
    </div>
    <div class="form-group text-center">
      <%= link_to 'Cancel', posts_path %>
    </div>
  <% end %>
</div>

******** OLD REGIST *******
<h2>Sign up</h2>

<%= simple_form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>
  <%= f.error_notification %>

  <div class="form-inputs">
    <%= f.input :user_name, required: true %>
    <%= f.input :email, required: true, autofocus: true %>
    <%= f.input :password, required: true, hint: ("#{@minimum_password_length} characters minimum" if @minimum_password_length) %>
    <%= f.input :password_confirmation, required: true %>
  </div>

  <div class="form-actions">
    <%= f.button :submit, "Sign up" %>
  </div>
<% end %>

<%= render "devise/shared/links" %>


<%= render "devise/shared/links" %>

.registration-bg
  .container
    .row
      .col-md-4.col-md-offset-4
        .log-in.panel
          .panel-heading
          %h2 Create Your Account
          = simple_form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f|
            = f.error_notification
            .panel-body
              =f.input :email, required: true, autofocus: true, label: false, placeholder: 'Email', input_html: { class: 'input-lg' }
              =f.input :user_name, required:true, label: false, placeholder: 'User Name', input_html: { class:'input-lg'}
              =f.input :password, required:true, label: false, placeholder: 'Password', input_html: { class:'input-lg' }
              =f.input :password_confirmation, required: true, label: false, placeholder: 'Confirm Password', input_html: { class:'input-lg' }
              =f.button :submit, "Sign up", class: 'btn-lg btn-info btn-block'
