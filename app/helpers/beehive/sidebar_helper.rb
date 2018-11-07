module Beehive
  module SidebarHelper
    def sidebar_nav_item(label, uri, opts = {}, &block)
      content_tag :li, nil, class: 'nav-item' do
        capture do
          concat(content_tag(:a, nil, href: uri, class: 'nav-link') do
            capture do
              concat content_tag :i, nil, class: "fa fa-#{opts[:icon]}"
              concat label
            end
          end)
          concat content_tag :ul, capture(&block), class: 'nav flex-column' if block_given?
        end
      end
    end
  end
end
