require_relative '../../search_test'

module USCore
  class DiagnosticReportLabPatientStatusSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for DiagnosticReport search by patient + status'
    description %(
      A server SHOULD support searching by patient + status on the DiagnosticReport resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :diagnostic_report_lab_patient_status_search_test

    input :patient_id, default: '85'

    def resource_type
      'DiagnosticReport'
    end

    def scratch_resources
      scratch[:diagnostic_report_lab_resources] ||= []
    end

    def search_params
      {
        'patient': patient_id,
        'status': search_param_value('status')
      }
    end

    run do
      perform_search_test
    end
  end
end
