module Pyramid
  # Encapsulates the results of a grouped query. Represents the results as a map from entity id to corresponding query
  # result.
  class GroupedQuery
    attr_reader :group

    # @param [Array] ids the entity ids
    # @param [Hash] group the grouped query results
    # @param [Hash] options
    # @option options [Object] :default (+nil+) the default value to use if there is not a query result for a a given
    #   entity id
    def initialize(ids, group, options = {})
      default_value = options[:default]
      defaults = ids.each_with_object({}) {|id, m| m[id] = default_value}
      @group = defaults.merge(group)
    end

    def to_json
      group.to_json
    end
  end
end
