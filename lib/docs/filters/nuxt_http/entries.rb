module Docs
  class NuxtHttp
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        name = at_css('article > h1').content.strip
        node = at_css("li > a[href='#{File.basename(slug)}']")
        return name if node.nil?

        index = node.parent.parent.css("li > a").to_a.index(node)
        name.prepend "#{index + 1}. " if index
        name
      end

      def get_type
        node = at_css("li > a[href='#{File.basename(slug)}']")
        parent_node = node.parent.parent.previous_element.content.strip
        return "Guide" if parent_node == ''
        node.parent.parent.previous_element.content.strip
      end

      def additional_entries
        return []
      end
    end
  end
end
