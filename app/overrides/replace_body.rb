# encoding: utf-8

Deface::Override.new(:virtual_path => %q{layouts/spree_application},
                          :name => %q{replace_body},
                          :replace => %q{[data-hook='body']},
                          :closing_selector => %q{},
                          :text => %q{<body id="<%= (@body_id == 'signup' ? 'checkout' : @body_id) || controller.controller_name %>">
    <div id="container">
        <header>
          <%= link_to image_tag("store/logo.gif", :width => "300", :height => "58", :alt => "Rails Dog Radio", :id => "logo"), root_url %>
          <form action="#" >
          </form>
          <%= form_tag products_url, :method => :get do %>
            <input type="search" id="s1" class="empty" name="keywords" placeholder="搜索产品">
          <% end %>
          <nav>
            <%= link_to "产品", products_path %>
            <% if current_user %>
              <%= link_to t('my_account'), account_path, :class => "cart" %>
              <%= link_to t('logout'), destroy_user_session_path, :class => "cart" %>
            <% else %>
              <%= link_to t('log_in'), login_path, :class => "cart" %>
            <% end %>
            <%= link_to_cart %>
          </nav>
        </header>

        <% if content_for?(:banner) %>
          <div id="banner" role="banner">
            <%= yield :banner %>
          </div>
        <% end %>

        <div id="main" role="main">
          <% if flash.notice %>
            <div class="flash notice"><%= flash.notice %></div>
          <% end %>
          <% if flash[:error] %>
            <div class="flash errors"><%= flash[:error] %></div>
          <% end %>

          <%= yield %>
        </div>

        <% if content_for?(:sidebar) %>
          <div id="sidebar" role="sidebar">
            <%= yield :sidebar %>
          </div>
        <% end %>

    </div>

    <footer data-hook="footer">
      <div class="inner">
        <div id="contact-us">
          <h3>联系我们</h3>
          <p>
          020-8721220<br>
          <a href="mailto:sales@oyboss.com">sales@oyboss.com</a>
          </p>
        </div>

        <div id="menu">
          <h3>Menu</h3>
          <p>
          <a href="/about">关于</a><br />
          <a href="/privacy">服务条款</a>
          </p>
        </div>

        <p id="copyright">&copy; Copyright <%= Time.zone.now.year %> OyBoss.com All rights reserved</p>

      </div>
    </footer>
</body>})
