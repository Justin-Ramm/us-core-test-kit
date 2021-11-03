require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class ObservationLabPatientCategoryDateSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Observation search by patient + category + date'
    description %(
      A server SHALL support searching by patient + category + date on the Observation resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :observation_lab_patient_category_date_search_test

    input :patient_id, default: '85'

    def properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Observation',
        search_param_names: ['patient', 'category', 'date']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:observation_lab_resources] ||= []
    end

    run do
      run_search_test
    end
  end
end
