module Ruboty
  module Gitlab
    module Actions
      class Remember < Base
        def call
          remember
          report
        end

        private

        def report
          message.reply("Remembered #{sender_name}'s gitlab private token")
        end

        def remember
          private_tokens[sender_name] = given_private_token
        end

        def given_private_token
          message[:token]
        end
      end
    end
  end
end
