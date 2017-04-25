Company.create!(name: 'Aethos')

Admin.create(email: 'admin@test.com', password: 'password', first_name: 'Admin', last_name: 'Representative', phone: '15555555780', company_id: Company.last.id)

Representative.create!(email: 'test@test.com', password: 'password', first_name: 'Jesse', last_name: 'Cooke', phone: '14804705780', company_id: Company.last.id)

Lead.create!(phone: '14807347831', representative_id: 2, first_name: 'Brad', last_name: 'campbell')