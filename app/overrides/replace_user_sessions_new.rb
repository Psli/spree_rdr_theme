# encoding: utf-8

Deface::Override.new(:virtual_path => %q{user_sessions/new},
                          :name => %q{replace_user_sessions_new},
                          :replace => %q{#existing-customer},
                          :text => %q{
<% if Rails.application.railties.all.map(&:railtie_name).include? "spree_social" %>
<%= render 'shared/social_users' %>
<% end %>
<div id="local_login">

  <div id="existing-customer">
    <h2>已经注册用户</h2>
    <p>请重新登录:</p>
    <%= render :partial => 'shared/login' %>
  </div>

  <hr/>

  <div id="new_customers">
    <h2>新用户</h2>
    <p>未注册用户请进行注册:</p>
    <%= form_for(:user, :url => registration_path(User.new)) do |f| %>

        <% if session[:omniauth] %>
          <p>
            <%= f.label :email, t("email") %>
            <%= f.text_field :email, :class => 'title'  %>
          </p>
        <% else %>
          <%= render 'shared/user_form', :f => f %>
        <% end %>
        <p>
          <button type="submit">注册</button>
        </p>
      <% end %>


  </div>
</div>
})
