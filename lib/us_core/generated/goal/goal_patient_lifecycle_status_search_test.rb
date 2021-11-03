require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class GoalPatientLifecycleStatusSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Goal search by patient + lifecycle-status'
    description %(
      A server SHOULD support searching by patient + lifecycle-status on the Goal resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :goal_patient_lifecycle_status_search_test

    input :patient_id, default: '85'

    def properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Goal',
        search_param_names: ['patient', 'lifecycle-status']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:goal_resources] ||= []
    end

    run do
      run_search_test
    end
  end
end
