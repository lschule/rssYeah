ENV['BONSAI_INDEX_URL'] = 'http://index.bonsai.io/llxopvypuzll59mxpywx'

if ENV['BONSAI_INDEX_URL'].present? then

  BONSAI_INDEX_NAME = ENV['BONSAI_INDEX_URL'].split('/')[-1]

  Tire.configure do
    url 'http://index.bonsai.io/'
  end

  # monkey patch index_name
  # no index name because it already is in the url
  # => bonsai shares 1 index per app
  module Tire
    module Model
      module Naming
        module ClassMethods
          def index_name name=nil, &block
            @index_name = BONSAI_INDEX_NAME
            @index_name
          end
        end
      end
    end
  end

end
