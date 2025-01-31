FactoryBot.define do
  factory :loan do
    association :equipament
    association :user

    start_date { Loan.date_between(from: 1.year.ago, to: Date.today) }
    end_date { Loan.date_between(from: start_date, to: 1.year.from_now) }
    # Traits permitem criar variações do factory base de forma organizada e reutilizável.

    trait :past_loan do
      start_date { Loan.date_between(from: 2.years.ago, to: 1.year.ago) }
      end_date { Loan.date_between(from: start_date, to: 1.year.ago) }
    end

    trait :current_loan do
      start_date { Loan.date_between(from: Date.today - 30, to: Date.today) }
      end_date { Loan.date_between(from: start_date, to: Date.today + 30) }
    end

    trait :future_loan do
      start_date { Loan.date_between(from: Date.today + 1, to: 1.year.from_now) }
      end_date { Loan.date_between(from: start_date, to: 2.years.from_now) }
    end

    trait :with_late_return do
      start_date { Loan.date_between(from: 2.years.ago, to: 1.year.ago) } # Empréstimo já deveria ter começado
      end_date { Loan.date_between(from: start_date, to: Date.today - 1) } # Devolução atrasada
    end

    # Outros atributos do empréstimo, se houver
    # Exemplo:
    # returned { Faker::Boolean.sample }
    # late_fee { returned ? 0 : Faker::Number.decimal(l_digits: 2) }
  end
end
