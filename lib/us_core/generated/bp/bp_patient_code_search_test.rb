require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class BpPatientCodeSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Observation search by patient + code'
    description %(
      A server SHALL support searching by patient + code on the Observation resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :bp_patient_code_search_test

    input :patient_id, default: '85'

    def properties
      @properties ||= SearchTestProperties.new(
        first_search: true,
        fixed_value_search: true,
        resource_type: 'Observation',
        search_param_names: ['patient', 'code']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:bp_resources] ||= []
    end

    run do
      run_search_test
    end
  end
end
