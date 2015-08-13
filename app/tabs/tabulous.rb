Tabulous.setup do

  tabs do
    categories_tab do
      text { 'Categories' }
      link_path { categories_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('categories') }
    end

    items_tab do
      text { 'Items' }
      link_path { items_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('items') }
    end


    # itemlists_tab do
    #   text          { 'Itemlists' }
    #   link_path     { itemlists_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('itemlists') }
    # end
    receivings_tab do
      text { 'Receivings' }
      link_path { receivings_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('receivings') }
    end

    issuances_tab do
      text { 'Issuances' }
      link_path { issuances_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('issuances') }
    end

    stocks_tab do
      text { 'Stocks' }
      link_path { stocks_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('stocks') }
    end

    # siteusers_tab do
    #   text          { 'Siteusers' }
    #   link_path     { siteusers_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('siteusers') }
    # end

    # admins_tab do
    #   text          { 'Admins' }
    #   link_path     { admins_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('admins') }
    # end

    welcome_tab do
      text { 'About' }
      link_path { root_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('welcome') }
    end

  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
    # or create your own renderer class and reference it here
    renderer :bootstrap_pill

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#428bca'
    text_color '#cccccc'
    active_tab_color '#164dca'
    hover_tab_color '#428bca'
    inactive_tab_color '#66afe9'
    inactive_text_color '#888888'

  end

  tabs(:reports) do
    repstock_tab do
      text { 'Stock' }
      link_path { stockselect_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('repstock') }
    end
    received_stock_tab do
      text { 'Received' }
      link_path { repselectreceiveg_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('received') }
    end
    issued_stock_tab do
      text { 'Issued' }
      link_path { repselectissueg_path }
      visible_when { true }
      enabled_when { true }
      active_when { in_action('any').of_controller('issued') }
    end
  end


end
