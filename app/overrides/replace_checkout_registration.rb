# encoding: utf-8

Deface::Override.new(:virtual_path => %q{checkout/registration},
                          :name => %q{replace_checkout_registration},
                          :replace => %q{#registration},
                          :text => %q{<div id="checkout" role="checkout" class="clearfix checkout">
  <div id="title" role="title" class="title">支付</div>
  <!-- START MAIN CONTENT -->
  <div id="main-content" role="main-content" class="main-content">
    <%= render "shared/error_messages", :target => @order %>
    <div id="tabs" role="tabs" class="tabs">
      <ul>
        <li class='active'><span class="number">1</span><span class="title">创建用户</span></li>
        <li><span class="number">2</span><span class="title">地址填写</span></li>
        <li><span class="number">3</span><span class="title">快递选择</span></li>
        <li><span class="number">4</span><span class="title">支付选项</span></li>
        <li><span class="number">5</span><span class="title">订单完成</span></li>
      </ul>
    </div>
    <div id="content" role="content" class="content">
      <div id="existing-customer">
        <h2>已经注册用户</h2>
        <p>请重新登录:</p>
        <%= render :partial => 'shared/login' %>
      </div>

      <hr>

      <%= render :template => 'user_registrations/new' %>
    </div>
  </div>
  <!-- END MAIN CONTENT -->
  <%= render 'summary' %>
</div>})
