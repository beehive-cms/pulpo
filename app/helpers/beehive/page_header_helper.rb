# http://www.sentia.com.au/blog/better-rails-view-helpers-or-how-to-blocks-and-awesome-too
module Beehive
  module PageHeaderHelper
    Context = Struct.new(:h, :body_data, :actions_data) do
      def body(&block)
        body_data[:content] = h.capture(&block)
      end

      def actions(&block)
        actions_data[:content] = h.capture(&block)
      end
    end

    def page_header(&block)
      context = Context.new(self, { content: '' },
                                  { content: '' })

      capture { block.call context }

      content_tag :div, nil do
        capture do
          concat content_tag :h1, 'Page title'
          concat context.body_data[:content]
        end
      end
    end
  end
end
