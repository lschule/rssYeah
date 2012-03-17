if ENV['BONSAI_INDEX_URL'].present? then

  Tire.configure do
    url ENV['BONSAI_INDEX_URL']
  end

  # monkey patch index_name
  # no index name because it already is in the url
  # => bonsai shares 1 index per app
  module Tire
    module Model
      module Naming
        module ClassMethods
          def index_name name=nil, &block
            @index_name = ''
            @index_name
          end
        end
      end
    end
  end

end
