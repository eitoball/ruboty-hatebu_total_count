module Ruboty
  module Handlers
    class HatebuTotalCount < Base
      on /count (?<site>\S+)/, description: 'count total bookmarks', name: :count

      def count(message)
        Ruboty::HatebuTotalCount::Actions::Count.new(message).call
      end
    end
  end
end
