//table for targets

exports.up = function(knex, Promise) {
  return knex.schema.createTable('targets', function(table) {
    table.increments();
    table.string('target_name');
    table.string('target_location');
    table.string('target_photo');
    table.string('target_security');
})
};




exports.down = function(knex, Promise) {
  return knex.schema.dropTable('targets');
};
