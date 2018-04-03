class PatientCondition < ApplicationRecord
  belongs_to :patient
  belongs_to :condition
end
