require_relative '../../search_test'

module USCore
  class MedicationRequestPatientIntentAuthoredonSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for MedicationRequest search by patient + intent + authoredon'
    description %(
      A server SHOULD support searching by patient + intent + authoredon on the MedicationRequest resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :medication_request_patient_intent_authoredon_search_test

    input :patient_id, default: '85'

    def resource_type
      'MedicationRequest'
    end

    def scratch_resources
      scratch[:medication_request_resources] ||= []
    end

    def search_params
      {
        'patient': patient_id,
        'intent': search_param_value('intent'),
        'authoredon': search_param_value('authoredOn')
      }
    end

    run do
      perform_search_test
    end
  end
end
