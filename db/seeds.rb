# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Kat.create(birth_date: '1980/01/09', color: 'blue', name: 'Zorro', sex: 'F', description: 'CRAZY MONSTER')
Kat.create(birth_date: '2009/01/09', color: 'blue', name: 'Monster', sex: 'F', description: 'CRAZY MONSTER')
Kat.create(birth_date: '2010/01/09', color: 'blue', name: 'Tum Tum', sex: 'F', description: 'CRAZY MONSTER')
Kat.create(birth_date: '2000/01/09', color: 'blue', name: 'Luffy', sex: 'F', description: 'CRAZY MONSTER')
CatRentalRequest.create(cat_id: 1, start_date: '2018/01/01', end_date: '2018/02/18', status: 'APPROVED')
CatRentalRequest.create(cat_id: 2, start_date: '2018/01/01', end_date: '2018/02/18', status: 'APPROVED')
CatRentalRequest.create(cat_id: 3, start_date: '2018/01/01', end_date: '2018/02/18', status: 'APPROVED')
CatRentalRequest.create(cat_id: 4, start_date: '2018/01/01', end_date: '2018/02/18', status: 'APPROVED')
CatRentalRequest.create(cat_id: 1, start_date: '2017/01/01', end_date: '2019/02/18', status: 'APPROVED')
