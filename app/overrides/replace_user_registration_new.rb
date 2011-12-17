# encoding: utf-8

 Deface::Override.new(:virtual_path => %q{user_registrations/new},
                          :name => %q{replace_user_registration_new},
                          :replace => %q{#new-customer},
                          :text => %q{<div id="new_customers">
    <h2>注册新用户</h2>
    <p>请填写下面项进行注册:</p>
    <%= form_for(:user, :url => registration_path(User.new)) do |f| %>
      <%= render 'shared/user_form', :f => f %>
      <p>
        <button type="submit">注册</button>
      </p>
    <% end %>
  </div>})
