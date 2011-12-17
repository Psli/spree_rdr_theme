# encoding: utf-8

Deface::Override.new(:virtual_path => %q{checkout/_address},
                          :name => %q{replace_billing},
                          :replace => %q{#billing[data-hook]},
                          :text => %q{<% content_for :javascripts do %>
  <%= javascript_include_tag 'checkout', '/states' %>
<% end %>

<div id="content" role="content" class="content">
  <h2>你的信息</h2>
  <%= form.fields_for :bill_address do |bill_form| %>
    <div id="billing">
    <ul class="inner fields">
      <li class="half">
        <%= bill_form.label :firstname, "姓名" %>
        <%= bill_form.text_field :firstname %>
      </li>
      <li>
        <%= bill_form.label :address1, "收货地址" %>
        <%= bill_form.text_field :address1 %>
      </li>

      <li>
        <%= bill_form.label :city, "城市" %>
        <%= bill_form.text_field :city %>
      </li>
      <li>
        <%= bill_form.label :phone, "你的电话" %>
        <%= bill_form.text_field :phone %>
      </li>
    </ul>
    </div>
  <% end %>
  <div class="submit"><button type="submit" class="blue">下一步</button></div>
</div>})
