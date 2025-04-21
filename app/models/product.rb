class Product < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
        mappings dynamic: false do
            indexes :name, type: :text, analyzer: :english
            indexes :description, type: :text, analyzer: :english
            indexes :category, type: :keyword
            indexes :price, type: :float
        end
    end

    def as_indexed_json(options = {})
        self.as_json(only: [:name, :description, :category, :price])
    end

    def self.search_by_keyword(query)
        self.search({
          query: {
            multi_match: {
              query: query,
              fields: ['name^3', 'description', 'category']
            }
          }
        })
    end
end
