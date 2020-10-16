module Docs
  class Nuxt
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        name = at_css("article h1").content
        node = at_css("nav a[href='#{File.basename(slug)}']")

        return name if node.nil?

        parent_node = node.parent.parent.previous_element.css("svg")[0]
        main_node = parent_node.parent.parent.parent

        parent_index = main_node.css(">div svg").to_a.index(parent_node)
        index = node.parent.parent.css("> li > a").to_a.index(node)

        name.prepend "#{parent_index + 1}.#{index + 1}. " if index
        name
      end

      def get_type
        node = at_css("nav a[href='#{File.basename(slug)}']")
        node.parent.parent.previous_element.css("span")[0].content.strip
      end

      def additional_entries
        return []
      end
    end
  end
end
