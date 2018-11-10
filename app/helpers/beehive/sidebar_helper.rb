module Beehive
  module SidebarHelper
    def sidebar_nav_item(label, uri, opts = {}, &block)
      icon_class = opts[:text_icon].present? ? 'nav-item-icon--text' : nil

      content_tag :li, nil, class: 'nav-item' do
        capture do
          concat(content_tag(:a, nil, href: uri, class: 'nav-link') do
            capture do
              concat(
                content_tag(:div, nil, class: ['nav-item-icon', icon_class]) do
                  if opts[:text_icon].present?
                    content_tag :span, opts[:text_icon]
                  elsif opts[:icon].present?
                    content_tag :i, nil, class: "fa fa-#{opts[:icon]}"
                  end
                end
              )
              concat label
            end
          end)
          concat content_tag :ul, capture(&block), class: 'nav flex-column' if block_given?
        end
      end
    end
  end
end
