require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class BpPatientCodeDateSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Observation search by patient + code + date'
    description %(
A server SHOULD support searching by
patient + code + date on the Observation resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[US Core Server CapabilityStatement](http://hl7.org/fhir/us/core/STU3.1.1/CapabilityStatement-us-core-server.html)

    )

    id :us_core_311_bp_patient_code_date_search_test

    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements',
      default: '85,355'

    def properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Observation',
        search_param_names: ['patient', 'code', 'date'],
        possible_status_search: true,
        token_search_params: ['code'],
        params_with_comparators: ['date']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:bp_resources] ||= {}
    end

    run do
      run_search_test
    end
  end
end