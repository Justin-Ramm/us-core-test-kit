require_relative '../../search_test'

module USCore
  class PatientGenderSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Patient search by gender'
    description %(
      A server MAY support searching by gender on the Patient resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :patient_gender_search_test

    def resource_type
      'Patient'
    end

    def scratch_resources
      scratch[:patient_resources] ||= []
    end

    def search_params
      {
        'gender': search_param_value('gender')
      }
    end

    run do
      perform_search_test
    end
  end
end
