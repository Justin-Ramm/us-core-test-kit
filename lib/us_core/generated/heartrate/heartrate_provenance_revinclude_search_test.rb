require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class HeartrateProvenanceRevincludeSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns Provenance resources from Observation search by patient + code + revInclude:Provenance:target'
    description %(
      A server SHALL be capable of supporting _revIncludes:Provenance:target.

      This test will perform a search by patient + code + revInclude:Provenance:target and
      will pass if a Provenance resource is found in the response.
    %)

    id :us_core_311_heartrate_provenance_revinclude_search_test

    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements',
      default: '85,355'

    def properties
      @properties ||= SearchTestProperties.new(
        fixed_value_search: true,
        resource_type: 'Observation',
        search_param_names: ['patient', 'code'],
        possible_status_search: true
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def self.provenance_metadata
      @provenance_metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, '..', 'provenance', 'metadata.yml')))
    end

    def scratch_resources
      scratch[:heartrate_resources] ||= {}
    end

    def scratch_provenance_resources
      scratch[:provenance_resources] ||= {}
    end

    run do
      run_provenance_revinclude_search_test
    end
  end
end