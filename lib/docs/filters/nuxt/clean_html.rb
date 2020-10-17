module Docs
  class Nuxt
    class CleanHtmlFilter < Filter
      def call
        @doc = at_css('article')

        # at_css('h1').content = 'Nuxt.js' if root_page?
        # doc.child.before('<h1>Nuxt.js API</h1>') if slug == 'api/'

        css('.demo', '.guide-links', '.footer', '#ad', '>div.pt-4', 'button').remove

        # Remove code highlighting
        css('figure').each do |node|
          node.name = 'pre'
          node.content = node.at_css('td.code pre').css('.line').map(&:content).join("\n")
          node['data-language'] = node['class'][/highlight (\w+)/, 1]
        end

        css('pre').each do |node|
          node.content = node.content.strip
          node['data-language'] = 'javascript'
        end

        css('iframe').each do |node|
          node['sandbox'] = 'allow-forms allow-scripts allow-same-origin'
        end

        css('details').each do |node|
          node.name = 'div'
        end

        doc
      end
    end
  end
end