//table for assassins

exports.up = function(knex, Promise) {
  return knex.schema.createTable('assassins', function(table) {
    table.increments();
    table.string('fullnames');
    table.string('weapon');
    table.integer('age');
    table.integer('price');
    table.float('rating', 2, 1);//always do 2,1 when you don't want their rating to go over two digits before the decimal and 2 after.
    table.integer('kills');
  })
};




//   .then(function () {
//     return knex.schema.createTable('targets', function (table) {
//       table.increments();
//       table.string('target_name');
//       table.string('target_location');
//       table.string('target_photo');
//       table.integer('target_security');
//       table.string('client_name');
//       table.integer('budget');
//   })
// };


exports.down = function(knex, Promise) {
  return knex.schema.dropTable('assassins');
};
