require 'xmlrpc/client'

module Ruboty
  module HatebuTotalCount
    module Actions
      class Count
        attr_reader :message

        def initialize(message)
          @message = message
        end

        def call
          begin
            res = client.call('bookmark.getTotalCount', site)
            message.reply(res)
          rescue XMLRPC::FaultException => e
            message.reply(e.faultString)
          end
        end

        private

        def site
          message[:site]
        end

        def client
          XMLRPC::Client.new('b.hatena.ne.jp', '/xmlrpc', 80).tap do |c|
            # XXX: Hatena returns 'application/xml'
            c.singleton_class.prepend(Module.new do
              define_method(:parse_content_type) do |_|
                ['text/xml']
              end
            end)
          end
        end
      end
    end
  end
end
