//seed for assassins
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('assassins').del()
    .then(function () {
      // Inserts seed entries
      return knex('assassins').insert([
        {full_names: 'Alexander Duggan', weapon:'Sniper rifle', age: 31, price: 45, rating: 7.5, kills: 28 },
        {full_names: 'Anton Chigurh', weapon: 'Pneumatic Bolt Gun', age: 52, price: 40, rating: 9, kills: 72},
        {full_names: null, weapon: 'Pistol', age: 28, price: 20, rating: 6.5, kills: 35},
        {full_names: 'Jason Bourne', weapon: 'Parkour', age: 27, price: 25, rating: 7, kills: 48},
        {full_names: 'John Wick', weapon: 'Lots of guns', age: 35, price: 50, rating: 9.5, kills: 433},
        {full_names: 'Jules Winnfield', weapon:'Pistol', age: 26, price: 15, rating: 6.5, kills: 13},
        {full_names: 'Leon', weapon:'Everything', age: 41, price: 30, rating: 8.5, kills: 87},
        {full_names: 'Nikita Mears' , weapon: 'Silenced Pistols', age: 28, price: 30, rating: 7, kills: 32},
        {full_names: 'Pickle Rick', weapon: 'Lasers and Office Supplies', age: 60, price: 0, rating: 8, kills: 24}
      ]);
    });
};
  ('Pickle Rick', 'Solenya', 'Lasers and office supplies', 60, 0, 8, 24);
