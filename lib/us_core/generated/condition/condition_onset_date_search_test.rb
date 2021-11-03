require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class ConditionOnsetDateSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Condition search by onset-date'
    description %(
      A server MAY support searching by onset-date on the Condition resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :condition_onset_date_search_test

    def properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Condition',
        search_param_names: ['onset-date']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:condition_resources] ||= []
    end

    run do
      run_search_test
    end
  end
end
